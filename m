Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OKNna-0000DE-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 05:42:27 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id EC933F8C21
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:37:54 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Thu, 03 Jun 2010 23:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=9oDaKVvi6v4Oscw73W+cnpfc1SQ=;
	b=qMw3I66W/lO4zp75wbMiaWctVnEabO3Hx/b7vTiWISccspxH8VWmnFzQ7dtHAxGuE8y9/B5hlvWlDw76Qpzhwslb0lxhZQbMXFGHPExOSd4/kXELVDBXNg9SJvO60MjCNtXz4ZN40eoiB8PQUmB5ZrNOHcZABijbrozb/2csrvo=
X-Sasl-enc: 54tVrsw2AnlO4PVxhI+Vb6Nv/G3tmtqHoggjCBBd6v8P 1275622674
Received: from [192.168.1.35] (hnvr-4d07a615.pool.mediaWays.net [77.7.166.21])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 53BB350FDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:37:54 -0400 (EDT)
Date: Fri, 4 Jun 2010 05:39:22 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100420161553.GA12219@denix.org>
Message-ID: <alpine.LNX.2.00.1006040532220.5274@asterix.crazy-teaparty.dyndns.org>
References: <1271752342-17886-1-git-send-email-vjensen@gmx.de>
	<20100420161553.GA12219@denix.org>
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
Subject: Re: [PATCH] base.bbclass: base_do_compile() accepts GNUmakefile as Makefile
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
X-List-Received-Date: Fri, 04 Jun 2010 03:42:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Tue, 20 Apr 2010, Denys Dmytriyenko wrote:

> On Tue, Apr 20, 2010 at 10:32:22AM +0200, Vitus Jensen wrote:
>> GNU make will look for GNUmakefile, makefile and Makefile.  GNUmakefile
>> isn't recommended but used by some programs, e.g. canutils.
>>
>> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Could someone please apply that patch?  Now that it's acked by two 
developers.

Thanks,
    Vitus

>> ---
>>  classes/base.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/classes/base.bbclass b/classes/base.bbclass
>> index d3bfa76..e738693 100644
>> --- a/classes/base.bbclass
>> +++ b/classes/base.bbclass
>> @@ -310,7 +310,7 @@ base_do_configure() {
>>  addtask compile after do_configure
>>  do_compile[dirs] = "${S} ${B}"
>>  base_do_compile() {
>> -	if [ -e Makefile -o -e makefile ]; then
>> +	if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
>>  		oe_runmake || die "make failed"
>>  	else
>>  		oenote "nothing to compile"
>> --
>> 1.5.6.5
>>
>>


-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


