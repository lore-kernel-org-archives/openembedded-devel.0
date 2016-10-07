Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3207719B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 16:23:12 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 49so2043646uac.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 09:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=utcg+q7vo8LIG0FqphW0fIyfjwy7bkgc6ZLyJMJLjaQ=;
	b=ZX2sF94zJEefi5wEGF5AkBKCAjKAXC7SLAMIXvmPDbebV+MCgHxQfYqg5ZIgQlG7O5
	XMaaN1LE9koxa4mNDLFFUbLBcsAzO63glXjN+Ji66KmDdb1aXCBPiJS+/350uXfzx1Oi
	zwuZRkaFEgWZTnID+NDmhE2u0ApGCPvYzqA8qkWfocfSUO6on5l3YKT+ERJC+yfmd1JS
	XVZ90SYcrd6SGQmxNJbsy7H+8mwdEQ4oRoLLrsoypdTU9G15kya8Nokcp1nwokoDmG8+
	sTChRb/ovSsEpDKYNSy4+0o1ZHETdW9nv2c0qGHHKaeN6Plv6ubZnwNFNRQx5AAeMrI0
	9JkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=utcg+q7vo8LIG0FqphW0fIyfjwy7bkgc6ZLyJMJLjaQ=;
	b=JZubiBy2YvmfBCFzIsiJX33NApPn22J7MY0xQRph/vKwXHoscb9vE5hHKUGnYXZ8BF
	GLB+tOseehbo8H22g+gzdFIEMgm2YgMSFYjddFn2BWNbmJcOHAkeaphgNU9y3EWORs6d
	6nMBFz7rzSTur4jXIAaBPT3N97E1vC545xI6T4DuBQp0RWI15zGJUC3TE1xTY19u4dEY
	yhIt+Izt+jy0CZ/WrgDxFfeHfMAj35VSGj919HVVRzpRiz+SKOuvEtQMMwfOX4t7MxfR
	w0R6S05pzguiZHCtvEU0n25/MPZMzbZ6OQ77XStk2P+S0clXWcIdtKVO5uRLgL+QjTYe
	0nFQ==
X-Gm-Message-State: AA6/9Rn9sMc/j37q4Xlo3CBBep1U1cK+7MDUE8VH9tRkEMDbMha3+zrlN64jxLGHrBv2Pnuc98u2YOsqR7MTBQ==
X-Received: by 10.176.64.229 with SMTP id i92mr15063369uad.32.1475857393771;
	Fri, 07 Oct 2016 09:23:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Fri, 7 Oct 2016 09:23:13 -0700 (PDT)
In-Reply-To: <E5E0F819-27C7-4FFD-9639-39BF2B9BE459@gmail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
	<1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
	<E5E0F819-27C7-4FFD-9639-39BF2B9BE459@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 7 Oct 2016 18:23:13 +0200
Message-ID: <CALbNGRRL2t1anoyHUMtBdWx8+7OkP=GkkdVDYH_Bne6+c7DAXg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/5] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 07 Oct 2016 16:23:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 7, 2016 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 7, 2016, at 2:19 AM, Andreas M=C3=BCller <schnitzeltony@googlemai=
l.com> wrote:
>>
>> portaudio backend is only available for windows builds - see README (and=
 if set
>> it would cause a cyclic dependency with portaudio's jack PACKAGECONFIG)
>
> should be unconditionally keep =E2=80=94portaudio=3Dno ?
As long as we are not building for windows: No

Andreas

