Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 274607017D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 20:07:24 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 35so990775uaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Aw5s0WSG6JzTEdchmUCmWtUnn5TEQ18b+HRnkI+GLE0=;
	b=qfVcdwYRpqDmiE9j6i0XGuU5dYeGLxbMIZ94D8TORtN/XxIasNIRhrT6KRc/vH638R
	yInN7FZdXkAxNJX6Aesty+qly6ETxoBbFHWXZACVto5A0BOggQ0QE80X2LSBUaPToyw3
	B4ZGoRvOQIDM3qC8IEIJPO2rEFTUh8RLgo4z1r0dIRmxEYdkdSBVSMACIF+bhj8AAioX
	L2xBmJ03+GyGegpQR6duV0qUBHyArHn568JiYmib9bZPvqoF2WnJkBxKBjJB0P3NvmRf
	rw8IEHHT2+B2TFWrHVu6LYg1Loz5wh+X6vvK7L3GtbEaWBAMQEp3ggGJ6ybnL7pckuey
	zlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Aw5s0WSG6JzTEdchmUCmWtUnn5TEQ18b+HRnkI+GLE0=;
	b=RUPfnrOoYOus/NSfH4+BPZtYmYxtQ5HmxEHS0QP8ETWYHU1mk3+C/Ork0+CT5myBp1
	zxo0rT/HkzxHCFLXkiK1XhNbiEzOKfewG//L9ki6vqOdeXX7G+YpfnGUCcapvewh/wWn
	k+m/Ag4Lc6l9+72fSPWteO+wS9gOyaZMqLrIVOKZgYHYgw+DKahCUOis0TbVTJmSZrqd
	03ni6IAYFXq/DP/GBgSXW1dmQsiwTJoRx+5/sR1RdF1FWCpI87Pz+ytkbVw1wuhumAb9
	ngrB1PdSFo4i5irc9oMDfw9US3rjAw7tdQxabO5nO6jXAdRsi/fTOSI8tiIQ2Z3Goh7Z
	nVbQ==
X-Gm-Message-State: AE9vXwM3hRCzHREKb4TyBmKSmWq1RZKHvURXfhOhjIOuQj7DBylk5xloBLA7afb+Ex4w2BcXSjSB2jtFLCIdhA==
X-Received: by 10.159.54.209 with SMTP id p75mr10767656uap.57.1473278844903;
	Wed, 07 Sep 2016 13:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 7 Sep 2016 13:07:24 -0700 (PDT)
In-Reply-To: <4DE889CF-CC0B-425B-89D0-1FC26ECCF07B@gmail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
	<294CDBE1-7350-4CDB-90C0-6E5110BF2466@gmail.com>
	<CALbNGRQgokOGY1-kCjvxnxA1v-_mtwO2du7V-dE6dDcSy9fHoQ@mail.gmail.com>
	<4DE889CF-CC0B-425B-89D0-1FC26ECCF07B@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 7 Sep 2016 22:07:24 +0200
Message-ID: <CALbNGRQaoBLcbcpU+nbyW0C9ZvyisWDtgGetfeLC8qWGSBaN7Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/5] samba: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Wed, 07 Sep 2016 20:07:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 7, 2016 at 6:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 6, 2016, at 2:29 PM, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
>>
>> On Tue, Sep 6, 2016 at 8:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Sep 4, 2016, at 1:15 PM, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com> wrote:
>>>>
>>>> Use this workaround as long as there is no better (upstream) fix
>>>>
>>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>>> ---
>>>> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb=
 b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>>> index e35d527..3205c5d 100644
>>>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>>>> @@ -88,7 +88,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
>>>>                "
>>>> DISABLE_STATIC =3D ""
>>>>
>>>> -LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>>>> +LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}=E2=80=9D
>>>
>>> what is the original problem ?
>>>
>> | default/source3/libsamba-cluster-support-samba4.so: error: undefined
>> reference to =E2=80=98dbghdrclass'
>
>
> Does it mean that we are missing some library or object on linker cmdline=
 ?
>
Have no idea. Googling around and checking samba's git I saw that it
tends to break with new version of binutils. Before changing linker, I
played around with patches adding dependencies / removing LDFLAGS all
did not lead to working build. So I finally replaced gold and samba is
fine again.

Andreas

