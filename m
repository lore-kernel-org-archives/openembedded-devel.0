Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 85C906E706
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 13:47:15 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so3991498obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Feb 2014 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=XNJgeyzT176CoCgwZEsuXyoQALKoIBRPc9o4rGGyeAk=;
	b=RJ5YnwnHCP+w9SuVYQJPSXxRNWxZgXEZnMESJVK1dLXZFwduLFDVwnll+ibGJi0Thj
	dqLGij+a9M0OYAF7NZ2zPakkz0hN1LFDGZNGU9bM6Vk2yJn8oXe3+pNMvh28eX8AaY5g
	PMx/DL/PJegZ7OqZQXW+mA/FX4NrDQkbTtR3fyjegTVX7Dsl7PAxwHwSfoHaxe7Z/GYc
	vr0YPgFcAPTk8e5FPCdkSM6mDz/G+9SRmLj9SrxC4aoCXytNsR8b5A+9U9hL/yY46783
	hy/rYNYkGoqcvG53Y6j+QMq7lOAc8ZGzEshdPAJNk9CBPuhCu8Ki0KVnsf6Xt5W6HChD
	KuKw==
MIME-Version: 1.0
X-Received: by 10.182.34.196 with SMTP id b4mr1821144obj.13.1391780836185;
	Fri, 07 Feb 2014 05:47:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 7 Feb 2014 05:47:16 -0800 (PST)
In-Reply-To: <52EFD53A.8060009@mlbassoc.com>
References: <CACgAsMeiKrLgjPnsZwOJtncRJ4nKExvjtS23VXNXcwyMsWtaDw@mail.gmail.com>
	<20140203173755.GE3698@jama> <52EFD53A.8060009@mlbassoc.com>
Date: Fri, 7 Feb 2014 11:47:16 -0200
X-Google-Sender-Auth: 6W2wUwGAY606y7_zyN1QKU-XoYg
Message-ID: <CAP9ODKpW=jrTZQfxwYrdTDwtsHh0AQoFU4w3KiX2earOcwxPAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-qt5
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
X-List-Received-Date: Fri, 07 Feb 2014 13:47:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 3, 2014 at 3:43 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2014-02-03 10:37, Martin Jansa wrote:
>>
>> On Mon, Feb 03, 2014 at 12:07:30PM -0500, Kevyn-Alexandre Par=E9 wrote:
>>>
>>> Morning Martin,
>>
>>
>> morning,
>>
>>> I found your email from here:
>>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/
>>>
>>> I'm searching for help on that package/doc
>>>
>>> If you prefer I can send my question to a specific mailing list if you
>>> pin point me where?
>>
>>
>> openembedded-devel@lists.openembedded.org is better place (see README
>> file)
>>
>>> So my goal is to run qt5 on my OMAP3 board by using yocto.
>>>
>>> I have fallow :
>>> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboa=
rd
>>> and &
>>> http://gpupowered.org/node/20
>>>
>>> Try to run this:
>>> root@overo:/# export QT_DEBUG_BACKINGSTORE=3D1
>>> root@overo:/# export QT_QPA_PLATFORM=3Dminimal
>>> root@overo:/# Qt5_CinematicExperience -plugin tslib
>>> libpng warning: iCCP: known incorrect sRGB profile
>>> libpng warning: iCCP: known incorrect sRGB profile
>>> This plugin does not support createPlatformOpenGLContext!
>>> QtQuick: failed to create OpenGL context
>>> This plugin does not support createPlatformOpenGLContext!
>>> QtQuick: failed to create OpenGL context
>>>
>>> Result:
>>> nothing is visible on my LCD except the console...
>>>
>>> So do you have any idea where I should start digging to simply start
>>> by making a qt5 example run on my board?
>>
>>
>> I've no experience with wandaboard, but few people asked about it with
>> relation to qt5, so maybe someone will respond on ML.
>>
>
> This works on my SabreLite which I built without X11 support.  I did not
> use any of your QT_xxx exports, only this command line.
>
>   # Qt5_CinematicExperience -platform eglfs -plugin
> tslib:/dev/input/touchscreen0

Same works for Wandboard. I have one customer using it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

