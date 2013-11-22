Return-Path: <andre.draszik@linaro.org>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8682F6B39C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 12:12:53 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id my13so758630bkb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 04:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=QRGRBYGwrnmLfuS/ZyIY9TPRKyfHlIy/ol3hAg0TLWk=;
	b=dPzya1uc90SOAQXvUgpH6b2iV+ll2TCscLcP91fUKlFWhCK4otGEqdYpu5NFvvQkDl
	JidPXxN9M1Vqvc/8GTWrpNQ+2r7kEZUe1fXUqzjNCcS6XZc9SVgNCc7w7Acn3O7bUukT
	kr6O+wA5Cea8A7szGneefyOAWvf1M8LgY7JfJk1VPO87+wL6QyfMusjhlFEEvqcnbW1g
	fNZwkBFpzNOkWO+Kwkfd4e8tnQanzaoX/UXbH5S0RPhJIjyCDGLGGHcYp/FYVBLwrVxP
	keWVPX96x3naCs8fr7y5dC+yVgbvbe7aikqS2bvVx9Obu70/cVn8LTnZIwYf3WGhzQI6
	PzZw==
X-Gm-Message-State: ALoCoQlfpNumnOUAtSG4ZllJ1QZNX1mxH2VRFUVATnqjVbCtHylByDcBfeYzuc87bwv0KhS/zDoc
X-Received: by 10.205.78.5 with SMTP id zk5mr9636900bkb.25.1385122372195;
	Fri, 22 Nov 2013 04:12:52 -0800 (PST)
Received: from [10.65.4.44] (sushi.andred.org. [85.214.105.253])
	by mx.google.com with ESMTPSA id
	on10sm31881802bkb.13.2013.11.22.04.12.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 22 Nov 2013 04:12:51 -0800 (PST)
Message-ID: <1385122369.23183.107.camel@bril0118.bri.st.com>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2013 12:12:49 +0000
In-Reply-To: <20131122105117.GB3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
	<CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
	<20131121173050.GA3708@jama>
	<1385109648.23183.38.camel@bril0118.bri.st.com>
	<20131122105117.GB3708@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Fri, 22 Nov 2013 12:12:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks Martin!

On Fri, 2013-11-22 at 11:51 +0100, Martin Jansa wrote:
> You can have recipes which use only qtbase-native and qmake only as
> build tool and don't use target qtbase at all.
> 
> Such recipes inherit qmake5_base to setup paths etc and shouldn't became
> MACHINE_ARCH just because target qtbase (which they don't use at all) is.

OK.

Would it be better / ok to move my patch into qt5.inc then?

My only (maybe unjustified) concern with this is: What defines if some
source code uses / can see configuration options from qtbase configure
time when invoking qmake? Purely that projects own build system? I can't
see anything in meta-qt5 that could affect this, unless I'm missing
something.

In other words, could a recipe build sources that depend on the Qt
configuration, without including qt5.inc?


Cheers,
Andre'



