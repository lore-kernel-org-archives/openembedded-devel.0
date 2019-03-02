Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B185B6C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 16:48:33 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m137so1576297ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2019 08:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YnsPNjUsddpZ7IQKWiFn5wWz31zFMNxrPY+daplyF8I=;
	b=amd7WYeOcX4WCwqLctNLdpy+ihaB1PfrKXu+KXawpsQAnnVhFxj8n8bsFh7yO+bjC1
	mA6mS8zTspUJw+ZxQ07IDE3dKdjKw6ZKEMZtR0TURWjkk1XUJ8tW5akINXw9QdtG9cMQ
	RS+aUJJ6oycNobRtHJgamKhTU+NOCUwyNfc0owJBuS2XnWsl+bdO7ValIvBdK0nTF9Ns
	lhV/aGM5wc/rOIi/0vQxT/kLjwcUpRzC9JHWBp9eXWNjQzG9wy3jnzlFZd4v2D6xLfoK
	O7hug96XT7I0dmCeA5wOwIvdeVZBmd85mDZcHa/PTXJD69URJ8/q9Ev9Ngu1RYD5aiPl
	d8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YnsPNjUsddpZ7IQKWiFn5wWz31zFMNxrPY+daplyF8I=;
	b=JnVb8bImqpMxSkZ0HTvotydY1ssQGj5xcznNK/g+PVYTB3Bc0/DPJYBqjZ+0p7iON5
	92oTuF4mwGfHiDsGUIba0ajaoTuCpICo3AkRZXfKB1HzHvYHmj3PC3M2TXNxdTqoMjmR
	02GKBFj6ACX7Pd6MjN10rNkPMeWjdT+f5oYjkNgO0YHuAJPmUTffubCtK9HqxNoUx2JI
	olfEl5d4s9N1JiI5qYiE5nh8DDoQ+ugR1TEA2TC+AC2/HeJpcLxMgITZAU1o//9ohfnl
	NO/qUAGlGRlw+g+NSLBbRCr+6YrHW8pqRYGOHO1CtWIBfxUiWhqRM3vxPDNLkKte/00c
	xkfA==
X-Gm-Message-State: AHQUAuaxxtODu2UnBC9e489lWEdecd2JSkqefw0iTi7uRvZ0cMEGLjvw
	dzn7cIV9babg09lxtJ/9h/ha/HH5UW4TEyG837o=
X-Google-Smtp-Source: APXvYqy4MaavZFxMAcPmlMh+rh2iNAXp3aqET9kiRrLioyn/fb7BJpg+FupfPZCtCzs9wePwLIEDb9C87qoGktQ5RQE=
X-Received: by 2002:a24:5c47:: with SMTP id q68mr6496160itb.81.1551545314594; 
	Sat, 02 Mar 2019 08:48:34 -0800 (PST)
MIME-Version: 1.0
References: <20190302025034.10954-1-raj.khem@gmail.com>
	<CALbNGRTf6TvxoQmC=fxGyVo31xn8w5p2sdJ3+aHmpPVn=EAEEA@mail.gmail.com>
	<CAMKF1sp9AYu_skZBkVXw8ezFpVF2mS4w41EFFvQDdTEuXBHs8Q@mail.gmail.com>
	<CALbNGRTtHwWWDGK7ebDgqw3Q03fzMaTfG14S-gWq0_MEjTUT7g@mail.gmail.com>
	<CAMKF1sq5MzbwSp-Rtqw8AuaS11TrdXa_hRxgJR-o2CX=JCjjdw@mail.gmail.com>
In-Reply-To: <CAMKF1sq5MzbwSp-Rtqw8AuaS11TrdXa_hRxgJR-o2CX=JCjjdw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 2 Mar 2019 17:48:22 +0100
Message-ID: <CALbNGRQ8sVaPyVCacGLd-dxeO5hSv4AtQRY0SNhewuSBerefFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] glm: Upgrade to 0.9.9.3
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
X-List-Received-Date: Sat, 02 Mar 2019 16:48:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2019 at 4:57 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Mar 2, 2019 at 7:20 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> >
> > On Sat, Mar 2, 2019 at 2:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > Dropping the patch breaks several packages for me.
> > > >
> > >
> > > can you forward port and submit upstream as well
> > No I can't. Would you accept a simple upgrade patch removing all musl p=
atches?
>
> I am asking for help since I don't understand these patches, and they are
> largish and the code around those area have changed a bit. It wont be
> good to hold a upgrade for these, since this will mean it will break
> building with gcc 9.x which is what prompted me to upgrade this in
> first place.
>
OK - go on - I will decide later when I get back to master how to get
around this.

Andreas

