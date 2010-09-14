Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ovctk-0007T9-Eo
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 23:19:06 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ovcsw-0002Fu-Pa from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:17:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 14 Sep 2010 14:17:49 -0700
Received: from [172.30.80.178] ([172.30.80.178]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 14 Sep 2010 15:17:48 -0600
Message-ID: <4C8FE671.9030205@mentor.com>
Date: Tue, 14 Sep 2010 14:17:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284493173-27463-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1284493173-27463-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 14 Sep 2010 21:17:48.0507 (UTC)
	FILETIME=[482BC2B0:01CB5452]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] python-native: configure unicode to ucs4
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
X-List-Received-Date: Tue, 14 Sep 2010 21:19:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Eric Bénard wrote:
> * while trying to run gdb from an SDK created by OE, I got the following
> errors: /usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-gdb: undefined symbol:
> PyUnicodeUCS2_FromEncodedObject
> 
> * the reason is that the workstation (ubuntu 10.04 or 9.01)'s Python is compiled using ucs4
> and the python-native used to create arm-angstrom-linux-gnueabi-gdb is using ucs2, the
> problem is detailed here :
> http://docs.python.org/faq/extending#when-importing-module-x-why-do-i-get-undefined-symbol-pyunicodeucs2
> 
> * configuring python-native with ucs=4 solves this problem.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Can you test this out on some form of Red Hat?  Thanks!

> ---
>  recipes/python/python-native_2.6.5.bb |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/python-native_2.6.5.bb
> index 66573e9..999335c 100644
> --- a/recipes/python/python-native_2.6.5.bb
> +++ b/recipes/python/python-native_2.6.5.bb
> @@ -20,6 +20,10 @@ S = "${WORKDIR}/Python-${PV}"
>  
>  inherit native
>  
> +EXTRA_OECONF_append = '\
> +  --enable-unicode=ucs4 \
> +'
> +
>  EXTRA_OEMAKE = '\
>    BUILD_SYS="" \
>    HOST_SYS="" \


-- 
Tom Rini
Mentor Graphics Corporation


