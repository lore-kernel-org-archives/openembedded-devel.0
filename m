Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Ki6JZ-000708-81
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Sep 2008 13:44:21 +0200
Received: (qmail invoked by alias); 23 Sep 2008 11:40:46 -0000
Received: from BAA0151.baa.pppool.de (EHLO [192.168.178.34]) [77.128.1.81]
	by mail.gmx.net (mp054) with SMTP; 23 Sep 2008 13:40:46 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX18Qc35GNc8Qw+cWhMjamI/0flegN7gDoYhbZ8gR0w
	X3VSIX5E+0lSu4
Message-ID: <48D8D5B3.8010708@gmx.de>
Date: Tue, 23 Sep 2008 13:40:35 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080923110049.B007318806A@amethyst.openembedded.net>
In-Reply-To: <20080923110049.B007318806A@amethyst.openembedded.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.48
Subject: Re: [oe-commits] : zaurus-2.6.inc: a string always is true, so test for the contents of it
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
X-List-Received-Date: Tue, 23 Sep 2008 11:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

OE GIT Trial schrieb:
> Module: OE.dev
> Branch: org.openembedded.dev
> Commit: 51e5f5be04d699828ab2f4a28e62ed6c789fb283
> URL:    http://gitweb.openembedded.net//OE.dev.git/?a=commit;h=51e5f5be04d699828ab2f4a28e62ed6c789fb283
>
> Author:  <koen@openembedded.org>
> Date:   Tue Sep 23 10:41:38 2008 +0000
>
> zaurus-2.6.inc: a string always is true, so test for the contents of it
>
> ---
>
>  conf/machine/include/zaurus-2.6.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/machine/include/zaurus-2.6.inc b/conf/machine/include/zaurus-2.6.inc
> index 5e8f34f..a688f2f 100644
> --- a/conf/machine/include/zaurus-2.6.inc
> +++ b/conf/machine/include/zaurus-2.6.inc
> @@ -52,7 +52,7 @@ zaurus_make_installkit () {
>      mkdir ${IMAGE_NAME}-installkit/
>  
>      # Get the latest kernel using the zImage-<machine>.bin symlink
> -    if [ "${@base_contains('MACHINE_FEATURES', 'kexecboot', 'true', 'false',d)}" ]; then
> +    if [ "${@base_contains('MACHINE_FEATURES', 'kexecboot', 'true', 'false',d)}" = "true" ]; then
>   
Did you test the other solution? I meant to put the programcall 'true' 
or 'false' in there. But I think I didn't test the negative case.
>  	    [ -f "zImage-kexecboot-${MACHINE}.bin" ] && cp zImage-kexecboot-${MACHINE}.bin ${IMAGE_NAME}-installkit/zImage
>  	    # we need also tgz for mmc or cf cards
>  	    cp ${IMAGE_NAME}.rootfs.tar.gz ${IMAGE_NAME}-installkit/image.tgz
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>   



