Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PDnEm-0002wt-CC
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:59:33 +0100
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LBC008LQ2LDM9C2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	03 Nov 2010 18:58:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 49DAC14AF6A; Wed,
	03 Nov 2010 19:58:25 -0400 (EDT)
Date: Wed, 03 Nov 2010 19:58:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101103235825.GD28852@denix.org>
References: <1288826934-8339-1-git-send-email-eric@eukrea.com>
	<4CD1F324.9090704@mentor.com>
MIME-version: 1.0
In-reply-to: <4CD1F324.9090704@mentor.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Eric B??nard <eric@eukrea.com>
Subject: Re: [PATCH] own-mirrors.bbclass: allow mirroring of scm	fetched packages
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
X-List-Received-Date: Wed, 03 Nov 2010 23:59:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 03, 2010 at 04:41:24PM -0700, Tom Rini wrote:
> Eric B??nard wrote:
>> this way, it's possible to setup a local webserver (for example
>> using busybox httpd -p "8081" -h backuped_download_dir) serving
>> a presiously fetched download directory and to build wihout the
>> need for an internet access
>> this can also be used when connected to know to know which packages
>> are missing from the local mirror's directory (and thus are fetched
>> from internet as a fallback), it's possible to run the server this way :
>> busybox httpd -p "8081" -h backuped_download_dir -vv -f | grep -B 1  
>> response:404
>> to get the name of the missing packages.
>> Signed-off-by: Eric B??nard <eric@eukrea.com>
>
> Acked-by: Tom Rini <tom_rini@mentor.com>

Looks like a nice way to have local mirrored downloads. May I suggest to put 
the above examples of running busybox httpd as a comment inside the class.

Acked-by: Denys Dmytriyenko <denis@denix.org>

>
>> ---
>>  classes/own-mirrors.bbclass |    7 ++++++-
>>  1 files changed, 6 insertions(+), 1 deletions(-)
>> diff --git a/classes/own-mirrors.bbclass b/classes/own-mirrors.bbclass
>> index e8a0f48..720ce42 100644
>> --- a/classes/own-mirrors.bbclass
>> +++ b/classes/own-mirrors.bbclass
>> @@ -1,4 +1,9 @@
>>  PREMIRRORS() {
>> -https?://.*/.* ${SOURCE_MIRROR_URL}
>> +cvs://.*/.* ${SOURCE_MIRROR_URL}
>> +svn://.*/.* ${SOURCE_MIRROR_URL}
>> +git://.*/.* ${SOURCE_MIRROR_URL}
>> +hg://.*/.* ${SOURCE_MIRROR_URL}
>> +bzr://.*/.* ${SOURCE_MIRROR_URL}
>> +https?$://.*/.* ${SOURCE_MIRROR_URL}
>>  ftp://.*/.*  ${SOURCE_MIRROR_URL}
>>  }
>
>
> -- 
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


