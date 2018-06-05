Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 401E475428
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 03:22:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w553MCe1013052
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Jun 2018 20:22:13 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 4 Jun 2018 20:22:12 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1526449970-15017-1-git-send-email-changqing.li@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <93dca85f-a81d-8cfe-b8e0-d7be0a6b16fb@windriver.com>
Date: Tue, 5 Jun 2018 11:22:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1526449970-15017-1-git-send-email-changqing.li@windriver.com>
X-Originating-IP: [128.224.162.228]
Subject: Re: [PATCH] postfix: Remove useless file makedeps.out
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2018 03:22:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping

On 05/16/2018 01:52 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> file /etc/postfix/makedeps.out is useless, remove it.
> makedeps.out is intermediate file that documents how Postfix was built for your machine.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta-networking/recipes-daemons/postfix/postfix.inc | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 09447d5..24e8607 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -207,6 +207,8 @@ do_install () {
>       chown :postdrop ${D}${sbindir}/postdrop
>       chmod g+s ${D}${sbindir}/postqueue
>       chmod g+s ${D}${sbindir}/postdrop
> +
> +    rm -rf ${D}/etc/postfix/makedefs.out
>   }
>   
>   do_install_append_class-native() {
> @@ -214,10 +216,6 @@ do_install_append_class-native() {
>       ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
>   }
>   
> -do_install_append_class-target() {
> -    # Remove references to buildmachine paths in target makedefs.out
> -    sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
> -}
>   
>   ALTERNATIVE_${PN} = "sendmail"
>   ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"

-- 
BRs

Sandy(Li Changqing)
+861084778653


