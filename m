Received: from mail-oa0-f42.google.com ([209.85.219.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UEIgm-0006Uz-Jy
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 13:15:53 +0100
Received: by mail-oa0-f42.google.com with SMTP id i18so3067377oag.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Mar 2013 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0hPTiiluPI2vLK1L+5BmZb4vJilt668mwVV6/YUPRiE=;
	b=szNdGeJSMwZjtMqRFEUK9VuHAlNj+DXFapmY+YwEYYnU5P19kbYJSTKe1cyngShMnx
	yUtv6O4ZQ63pBAsPY2mM0lvYUKtM4lxWhBvmY4/ZlblBCc/S+j2wGlexBbUCSEfrdSOu
	dqZlzOwewYkNqYa6JveQp7Igbd6xLs77jWtw1ggxDEiMJae24BHUiS2ts85YpOVD0XKM
	Jui5dciDC2UfQyXDyV/srOR8danPYR3v1KTEcaN8HAwSIbWyEct4mEnjvbqCGkAesGop
	vcNkrFS/uQRa/CiOUd5xghOsN8lqPtJVgP7G70bZHZgP4ZhF4Wclh6RT7Euv+PscNjKK
	0s2g==
MIME-Version: 1.0
X-Received: by 10.182.127.7 with SMTP id nc7mr4365924obb.94.1362830353139;
	Sat, 09 Mar 2013 03:59:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 9 Mar 2013 03:59:13 -0800 (PST)
In-Reply-To: <20130309063059.GA9724@jama.dyndns-home.com>
References: <1362768637-29343-1-git-send-email-otavio@ossystems.com.br>
	<1500617.PjPkZjIiXc@helios>
	<20130309063059.GA9724@jama.dyndns-home.com>
Date: Sat, 9 Mar 2013 08:59:13 -0300
X-Google-Sender-Auth: BU5kETn0Gi1X890SFFr_3e_pl5k
Message-ID: <CAP9ODKrrshRjygQ6CBSRfJJTXWTrM6Vy9ZhFsz+-7adqqrS5Gw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] polkit: Remove authentication override as it is handled in OE-Core
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
X-List-Received-Date: Sat, 09 Mar 2013 12:15:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 9, 2013 at 3:30 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Mar 08, 2013 at 10:48:17PM +0000, Paul Eggleton wrote:
>> On Friday 08 March 2013 15:50:37 Otavio Salvador wrote:
>> > OE-Core now handles the detection of authentication so we don't need
>> > to do it here. The bbappend file is kept to provide the upgrade path
>> > only, or the revision would go backwards.
>> >
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > ---
>> >  meta-oe/recipes-extended/polkit/polkit_0.104.bbappend | 9 +--------
>> >  1 file changed, 1 insertion(+), 8 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> > b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
>> > ea82e37..ceb2b6b 100644
>> > --- a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> > +++ b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
>> > @@ -1,8 +1 @@
>> > -PRINC := "${@int(PRINC) + 4}"
>> > -
>> > -POLKITAUTH ??= "consolekit"
>> > -
>> > -PACKAGECONFIG += "${POLKITAUTH}"
>> > -PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>> > -# there is no --enable/--disable option for consolekit and it's not picked
>> > by shlibs, so add it to RDEPENDS -PACKAGECONFIG[consolekit] =
>> > ",,,consolekit"
>> > +PRINC := "${@int(PRINC) + 5}"
>>
>> Can't we just bump PR in OE-Core?
>
> we dont know which oe-core and meta-oe revisions are used together and
> this needs to be applied in both at the same time.. so no, we need to
> wait for PE/PV change in oe-core.

I agree with Martin here; we cannot know which version combination
user is using so we cannot do that.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


