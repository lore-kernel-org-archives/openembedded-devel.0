Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TORWk-0005MU-Gm
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 13:11:06 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so6194550pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ce441tZL/MteBQITPdmj+hN+PrQdKw6NUo9PmrFNoIw=;
	b=WfZAalE3bW7Q7s0BQNZPfWiMhoggerYVQ2FBonPS59/LPsTYraCx7+Nsrxfy54SGR6
	ZoOg648SndJj0xhPtvv26bzEPDfq6R8V6kw16bbf66/5bmxJRfquzA9+zi5TOET9bj0U
	FW6T3kqHx3uG66dlFWs4JYZdWhextp+gAIi2s1y6CfbLA6FSosWA0XQFZ+mkO/7IapIp
	RJq/+H62ZCBlGl+oDXeRiNRDV+i48/NXJCc5eGeNYJ7H8LblcPlxIZJ9qCcQf+VV5nra
	lwpLkY3jXkayksm9wVBe3DVgFCBePy5+wNzJs/DOiKVhchdDbD+LPaosvBeVcyr6WxSZ
	2VPQ==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr54544532pbc.130.1350471467629; Wed,
	17 Oct 2012 03:57:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 17 Oct 2012 03:57:47 -0700 (PDT)
In-Reply-To: <1350464132-3965-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350464132-3965-1-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 17 Oct 2012 07:57:47 -0300
X-Google-Sender-Auth: piLg-ltFR8lDbILpI80mARxriG4
Message-ID: <CAP9ODKrKeiwxwWX17Lcxd__j9xFFm4rm2Hx7pQFW2R4jRHPRAA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe] Maliit: Add initial recipes
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
X-List-Received-Date: Wed, 17 Oct 2012 11:11:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 17, 2012 at 5:55 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com>wrote:

> +do_install() {
> +    cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> +
> +    #Fix absolute paths
> +    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf
> +    cd ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf
> +
>

You can use EXTRA_OEMAKE ans pass INSTALL_ROOT as an option. The sed can be
done using do_install_append() and you can avoid the cd and calling sed
using the full path for it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

