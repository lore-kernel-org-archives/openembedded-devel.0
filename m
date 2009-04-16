Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LuFBH-00030n-MJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 02:10:48 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI600HKW2XTSOV6@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	15 Apr 2009 19:05:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 400F96B83B5; Wed,
	15 Apr 2009 20:05:53 -0400 (EDT)
Date: Wed, 15 Apr 2009 20:05:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090416000553.GA2118@denix.org>
References: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
MIME-version: 1.0
In-reply-to: <1239782395-12413-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: Re: [PATCH] base.bbclass: Combine all checksum.ini files	found in BBPATH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2009 00:10:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 15, 2009 at 10:59:55AM +0300, petri.lehtinen+openembedded-devel@inoi.fi wrote:
> From: Petri Lehtinen <petri.lehtinen@inoi.fi>
> 
> This makes it possible for overlays to have checksum.ini.

Tested on my overlay - seems to work as advertised.

Acked-by: Denys Dmytriyenko <denis@denix.org>


> Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
> ---
>  classes/base.bbclass |   22 +++++++++++++---------
>  1 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 9ec705b..e5fd814 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -40,12 +40,11 @@ def base_path_relative(src, dest):
>      return sep.join(relpath)
>  
>  # for MD5/SHA handling
> -def base_chk_load_parser(config_path):
> +def base_chk_load_parser(config_paths):
>      import ConfigParser, os, bb
>      parser = ConfigParser.ConfigParser()
> -    if not len(parser.read(config_path)) == 1:
> -        bb.note("Can not open the '%s' ini file" % config_path)
> -        raise Exception("Can not open the '%s'" % config_path)
> +    if len(parser.read(config_paths)) < 1:
> +        raise ValueError("no ini files could be found")
>  
>      return parser
>  
> @@ -620,13 +619,18 @@ python base_do_fetch() {
>  
>  	# Verify the SHA and MD5 sums we have in OE and check what do
>  	# in
> -	check_sum = bb.which(bb.data.getVar('BBPATH', d, True), "conf/checksums.ini")
> -	if not check_sum:
> -		bb.note("No conf/checksums.ini found, not checking checksums")
> -		return
> +	checksum_paths = bb.data.getVar('BBPATH', d, True).split(":")
> +
> +	# reverse the list to give precedence to directories that
> +	# appear first in BBPATH
> +	checksum_paths.reverse()
>  
> +	checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
>  	try:
> -		parser = base_chk_load_parser(check_sum)
> +		parser = base_chk_load_parser(checksum_files)
> +	except ValueError:
> +		bb.note("No conf/checksums.ini found, not checking checksums")
> +		return
>  	except:
>  		bb.note("Creating the CheckSum parser failed")
>  		return
> -- 
> 1.6.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


