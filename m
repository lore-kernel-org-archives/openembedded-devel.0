Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 736AC780A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 01:02:17 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so7099716pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 18:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cBIVzYE6jLFDfG1XqRx5eJKgt/NkbE/IrY4b+sQt0ts=;
	b=YBIdOrQdyDJjUwWkAwlcC9vROG1WhWBqjBNU4q3pXSiIpmLGZxGZ1MmvQIBJgK0/ZX
	WfD+9E3MbCKo7vZdCnxd3ZIDxQ79UQyYhtKcVeiEG2LbhF4yyyCaXNIBTij0sGoaQ6RQ
	74yOC38NSEZxvHSKhcGZsVH/MdibE8G7CCEJf4FY0YAPUOaaANMrHREEhFCiSSlW/grw
	0SlkROdT+qPIW8g7J5seI3Wpv7g8pNww1Ng/0sZfi3U4QY6uHKTpjHVnaoKsv7ar5Xp4
	EB0GG9BDlVqteszO7X08orkFN3H+FM4Lmv/84DqDIxFFcvGDbhhtBwcIXqRWqJNlqp4W
	MMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cBIVzYE6jLFDfG1XqRx5eJKgt/NkbE/IrY4b+sQt0ts=;
	b=c6C02vCTwqU0pvNgUd7Ji6w07kxxOOlZK+Adek7T5dgml2NCDrkTqRcf4HoXcKZ4jl
	P0qAarHmIma06fsor/KZgnx0G2nsOQzhfmrqAtrRbHxWLhj9i0uAkWpyjkgdAywQpZeb
	u461JrSynKmj2POPkwMSa9WzicoYpezL5kDtOzDMe/+6E9K4R4JYsqP/iKnBaNvVegcX
	l9nYrSEkDPfLpO9yzojjf7LB3qCPstEdoiwF+KX2An6L8Ag81Wg/3GE8X4OmdViiMa0q
	cwxiOY7rASBCRLP6QJh1LJEGsia3vIitgsjlfS3vC6/x3uJY1pk95kpc8lo8rJ50hNfx
	3Jeg==
X-Gm-Message-State: AHYfb5iEA/fUD9LsXHuqYHmic/8LJDMeL6N7SjFwdv75HetIPY3IDZ3I
	jp7k1D+NuO1hNL87apAIlEGrTAPpYg==
X-Received: by 10.98.147.19 with SMTP id b19mr3465310pfe.283.1502931738659;
	Wed, 16 Aug 2017 18:02:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Wed, 16 Aug 2017 18:01:48 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B8652B2@ALA-MBD.corp.ad.wrs.com>
References: <20170816053740.24934-1-jackie.huang@windriver.com>
	<CAMKF1sr1sKAThgm-tJPam+VAMqg4=wtSv7qhZ5ciBq+c6-gjsg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8652B2@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2017 18:01:48 -0700
Message-ID: <CAMKF1sqf3=F9S2EymZnJ2N77=qx1-svNAVU+t7rd9qvnFxctvQ@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] vlock: add new recipe
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
X-List-Received-Date: Thu, 17 Aug 2017 01:02:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2017 at 5:48 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Thursday, August 17, 2017 01:12
>> To: Huang, Jie (Jackie)
>> Cc: openembeded-devel
>> Subject: Re: [oe] [meta-oe][PATCH v2] vlock: add new recipe
>>
>> On Tue, Aug 15, 2017 at 10:37 PM,  <jackie.huang@windriver.com> wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > vlock is a program to lock one or more
>> > sessions on the Linux console.
>> >
>> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> > ---
>> >  .../vlock/vlock-2.2.3/disable_vlockrc.patch        |  37 +++++++
>> >  .../vlock/vlock-2.2.3/vlock-no_tally.patch         | 107
>> +++++++++++++++++++++
>> >  .../recipes-extended/vlock/vlock-2.2.3/vlock_pam   |   3 +
>> >  .../vlock/vlock-2.2.3/vlock_pam_tally2_reset.patch |  19 ++++
>> >  meta-oe/recipes-extended/vlock/vlock_2.2.3.bb      |  59 ++++++++++++
>> >  5 files changed, 225 insertions(+)
>> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-
>> 2.2.3/disable_vlockrc.patch
>> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock-
>> no_tally.patch
>> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-2.2.3/vlock_p=
am
>> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock-
>> 2.2.3/vlock_pam_tally2_reset.patch
>> >  create mode 100644 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
>> >
>> > diff --git a/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockr=
c.patch
>> b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
>> > new file mode 100644
>> > index 000000000..ee0d074de
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/vlock/vlock-2.2.3/disable_vlockrc.patch
>> > @@ -0,0 +1,37 @@
>> > +Upstream-Status: Inappropriate [configuration]
>> > +
>> > +written by: Jeff Polk <jeff.polk@windriver.com>
>>
>> I think a SOB is better than inventing another tag.
>
> I just follow the guideline:
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Importin=
g_from_Elsewhere
>
> """
> It is also necessary to document the original author of the change. You s=
hould indicate the original author by simply stating "written by" or "poste=
d to the ... mailing list by". You must not add a Signed-off-by: tag line w=
ith their name, only the original author may add their own Signed-off-by: t=
ag line.
> """
>

I wasn't suggesting that you add SOB for someone else. I was suggesting to
not have original author attribution so close to the format for
Signed-off-by, tested-off-by etc. Something like

Original Patch from: < source >

where source is publicly listed URL where the patch is posted.


> Thanks,
> Jackie

