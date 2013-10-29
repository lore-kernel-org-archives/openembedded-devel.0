Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 46EBD6CEE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:14:08 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id 11so5365876vbe.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/PUhJ9sGNraHggt06QOu6TmT6/6fXWHLKQ5EgCOu+S8=;
	b=EXvWQt2CXRAIFdaJIa34IsPMgRMvQDGF8PsU0o3v5myt6rrl5G+dtOEiflrGCu+NgO
	1kHLxFJp7nVKom86eT15vPCiKK9Mg+sn6Ildv6OoqDKBrLqDEko34oarHPW4Qo2VYwzo
	EoZ5sD4Kb/WZkhPo0cmiZ15Dp+AfQz13jHYN18Hv9X3AuHFnh2whVPzTdelKQxwhJbZl
	hWHQ5xdfLG7pPNUIiO00+AXi0hgPfNfHFjWotbg3gegccqnpwYqsQktt+APUNBx3z4Qb
	kh+X1yX5khORPUcG3fkA7iC5de4t9ys8yHQEccnXCn3BURAUSI2Xd11svLUL6q5IQ2h3
	jSHg==
MIME-Version: 1.0
X-Received: by 10.52.100.202 with SMTP id fa10mr13705226vdb.0.1383034449777;
	Tue, 29 Oct 2013 01:14:09 -0700 (PDT)
Received: by 10.52.66.143 with HTTP; Tue, 29 Oct 2013 01:14:09 -0700 (PDT)
In-Reply-To: <20131029070736.GA3697@jama>
References: <1383001576-26578-1-git-send-email-schnitzeltony@googlemail.com>
	<20131029070736.GA3697@jama>
Date: Tue, 29 Oct 2013 09:14:09 +0100
Message-ID: <CALbNGRT7oocf2dD1UCjQdea1GNWo_s8SWcre1bELeTz0DguJVg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][RFC] qtbase: fix build for gles2 enabled by PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2013 08:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 8:07 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Oct 29, 2013 at 12:06:15AM +0100, Andreas M=C3=BCller wrote:
>> While playing around with QtQuick I needed gles2 support. Doing so I fac=
ed tons
>> of error messages as mentionet in patch. It is caused by include chain:
>>
>> EGL/egl.h -> EGL/eglplatform.h -> X11/Xlib.h -> X.h
>>
>> In X.h we find definitions like
>>
>> #ifndef None
>> #define None                 0L       /* universal null resource or null=
 atom */
>> #endif
>>
>> This causes building Qt to crash when using these kind of symbols.
>>
>> The patch was sent as RFC because:
>>
>> 1.  I would like ro discuss this at interest@qt-project.org and/or
>>     development@qt-project.org but it was not possible to subscribe. I s=
ent
>>     a mail to listmaster but no response either.
>> 2.  qtbase_git might need same (and fails with the patch)
>> 3.  This is not a proper solution: It is fragile and will return for fut=
ure
>>     changes. Proper soultion would be renaming the symbols Qt but I cann=
ot
>>     discuss due to 1.
>> 4.  Nobody reported a build error for meta-qt5 so far.
>
> We had similar problem, but fixed gles2 provider instead, in our case we
> were using libhybris and the fix was to prevent loading X11 headers when
> we want to use just gles2 from it.
>
> Similar changes were added to mesa lately, can you do the same with
> gles2 provider on your platform?
It is the egl part causing trouble and the headers we use are the
latest from khronos. I don't understand what the workaround exactly
looks like - could you provide further hints?
>
> I must admit that I haven't read the patch yet and haven't finished
> morning coffee :).
>
Andreas

