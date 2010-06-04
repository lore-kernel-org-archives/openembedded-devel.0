Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OKNqT-0005kL-1v
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 05:45:22 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 71C1BF8DA2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:41:06 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 03 Jun 2010 23:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=vFx6ZUf+/zBDcDyrfSYqVdNlmUE=;
	b=BAAWk/KRkdi4UZHyKOaj5uUgL10k2huukYDedu19eDaBW5LORhqFATsMB7QUF3NQflbSTP8MJ1byemSMzPpPHIMI5WC5XkRB3hhRXZm8ViaKLAZ+klzc/Rue8CtO3/sQEBEHPTyJ0X69KMB6jTOANV7GoAnDd7OB/oXFZggZOpE=
X-Sasl-enc: Hp0ixrJpyxyg2mj3QDjye/lufnQ4iAWmkiprgKy1P6Nd 1275622865
Received: from [192.168.1.35] (hnvr-4d07a615.pool.mediaWays.net [77.7.166.21])
	by mail.messagingengine.com (Postfix) with ESMTPSA id CF9E34CAAC8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:41:05 -0400 (EDT)
Date: Fri, 4 Jun 2010 05:42:36 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.1006040541390.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1004131528550.17768@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] base.bbclass: add support for checksums in .bb files
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
X-List-Received-Date: Fri, 04 Jun 2010 03:45:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Tue, 13 Apr 2010, Vitus Jensen wrote:

> From: Phil Blundell <philb@gnu.org>
>
> Ported from .dev branch to allow easy sharing of recipes between
> .dev and stable branches.
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>

May I get comments for this patch?  I think it is really helpfull.

Best regards,
    Vitus


> ---
>  classes/base.bbclass |   56
>  ++++++++++++++++++++++++++++++++++++++++++++-----
>  1 files changed, 50 insertions(+), 6 deletions(-)
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 69d1979..459fbe9 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -56,6 +56,50 @@ def base_chk_load_parser(config_paths):
>
>     return parser
>
> +def base_chk_file_vars(parser, localpath, params, data):
> +    try:
> +        name = params["name"]
> +    except KeyError:
> +        return False
> +    flagName = "%s.md5sum" % name
> +    want_md5sum = bb.data.getVarFlag("SRC_URI", flagName, data)
> +    flagName = "%s.sha256sum" % name
> +    want_sha256sum = bb.data.getVarFlag("SRC_URI", flagName, data)
> +
> +    if (want_sha256sum == None and want_md5sum == None):
> +        # no checksums to check, nothing to do
> +        return False
> +
> +    if not os.path.exists(localpath):
> +        localpath = base_path_out(localpath, data)
> +        bb.note("The localpath does not exist '%s'" % localpath)
> +        raise Exception("The path does not exist '%s'" % localpath)
> +
> +    if want_md5sum:
> +        try:
> +	    md5pipe = os.popen('PATH=%s md5sum %s' % (bb.data.getVar('PATH', 
> data, True), localpath))
> +            md5data = (md5pipe.readline().split() or [ "" ])[0]
> +            md5pipe.close()
> +        except OSError, e:
> +            raise Exception("Executing md5sum failed")
> +        if want_md5sum != md5data:
> +            bb.note("The MD5Sums did not match. Wanted: '%s' and Got: '%s'" 
> % (want_md5sum, md5data))
> +            raise Exception("MD5 Sums do not match. Wanted: '%s' Got: '%s'" 
> % (want_md5sum, md5data))
> +
> +    if want_sha256sum:
> +        try:
> +            shapipe = os.popen('PATH=%s oe_sha256sum %s' % 
> (bb.data.getVar('PATH', data, True), localpath))
> +            sha256data = (shapipe.readline().split() or [ "" ])[0]
> +            shapipe.close()
> +        except OSError, e:
> +            raise Exception("Executing shasum failed")
> +        if want_sha256sum != sha256data:
> +            bb.note("The SHA256Sums did not match. Wanted: '%s' and Got: 
> '%s'" % (want_sha256sum, sha256data))
> +            raise Exception("SHA256 Sums do not match. Wanted: '%s' Got: 
> '%s'" % (want_sha256sum, sha256data))
> +
> +    return True
> +
> +
>  def base_chk_file(parser, pn, pv, src_uri, localpath, data):
>      import os, bb
>      no_checksum = False
> @@ -652,15 +696,15 @@ python base_do_fetch() {
> 	 # Check each URI
> 	 for url in src_uri.split():
> 		localpath = bb.data.expand(bb.fetch.localpath(url, 
> localdata), localdata)
> -		(type,host,path,_,_,_) = bb.decodeurl(url)
> +		(type,host,path,_,_,params) = bb.decodeurl(url)
> 		 uri = "%s://%s%s" % (type,host,path)
> 		 try:
> -			if type == "http" or type == "https" or type == "ftp" 
> or type == "ftps":
> -				if not base_chk_file(parser, pn, pv,uri, 
> localpath, d):
> -					if not 
> bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS",d, True):
> -						bb.fatal("%s-%s: %s has no 
> entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
> +			if type in [ "http", "https", "ftp", "ftps" ]:
> +				if not (base_chk_file_vars(parser, localpath, 
> params, d) or base_chk_file(parser, pn, pv,uri, localpath, d)):
> +					if not 
> bb.data.getVar("OE_ALLOW_INSECURE_DOWNLOADS", d, True):
> +						bb.fatal("%s-%s: %s has no 
> checksum defined, cannot check archive integrity" % (pn,pv,uri))
> 					else:
> -						bb.note("%s-%s: %s has no 
> entry in conf/checksums.ini, not checking URI" % (pn,pv,uri))
> +						bb.note("%s-%s: %s has no 
> checksum defined, archive integrity not checked" % (pn,pv,uri))
> 		 except Exception:
>  			raise bb.build.FuncFailed("Checksum of '%s' failed" %
>  uri)
> }
>

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


