Return-Path: <behanw@converseincode.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 58BB777E99
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 04:37:55 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id v189so36571622pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 21:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=converseincode.com; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=zJA8eoSjlBSmtaYG85xNoNfyQ+phYH9Q49LI8aJSvaA=;
	b=AGlq2ehPojLXjgr1dM1IsH8oBvYoCy0lWVtHimqy9cBYTLBLuvQQwWgNnzE/2q5MYQ
	GcE+M9FaZHelLw9mCaR7khWL8kksKWptipaqFeINxOIAbsWCoxfXG3IEDeTGJ5mKp3h1
	sUI+/hvzUo35zsJi2SJYciuI/iqLOtk+B6vsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=zJA8eoSjlBSmtaYG85xNoNfyQ+phYH9Q49LI8aJSvaA=;
	b=Mx+4lSMnT+kid+AVoZtRW+GHElXH2OVqorga/WBPkz62c6XgIsXs61QAog704FVKV6
	+Ok8bJ7IGk1B5++gVleX6b4jmlcC7pMgWVdb64NJuI0i3HftHBZNxyCnJMfAmDFpW9MG
	RfhyLLciSuvEEGyyQZYkCrvTx+v5PiHrq8UHcOQvlNnX/+37ZjoXIjl5uekZtf248VtK
	9HtQPftvfJ5SXS2SP1MJJHKM/n13sp+xEr4yVcpAh8w3eYOw1tt5NmgG0SVTTtmwo3v8
	/BTqEC4+ppXZnMv5aXGobYyunPVH+6Cc8CgjLzikc7vKgUlXjGcT8BSw1P3nIEfv23IB
	j6/A==
X-Gm-Message-State: AHYfb5je+aKPyBHQ0Z+o4wRbrER1VIaMQ4s+XweJs0GzvDIme1l6WYL7
	Mo8UEjS8QDQ7SWzA
X-Received: by 10.84.231.204 with SMTP id g12mr11925201pln.131.1502339877267; 
	Wed, 09 Aug 2017 21:37:57 -0700 (PDT)
Received: from [192.168.120.225] (d207-6-122-147.bchsia.telus.net.
	[207.6.122.147]) by smtp.gmail.com with ESMTPSA id
	e131sm8548692pgc.64.2017.08.09.21.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 21:37:56 -0700 (PDT)
From: Behan Webster <behanw@converseincode.com>
Message-Id: <B3D9B02E-38F0-4F66-8BC6-4E40FE7D64AD@converseincode.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Wed, 9 Aug 2017 21:37:54 -0700
In-Reply-To: <893c3fce-14cf-adbf-6613-1297b0334210@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
References: <73F79297-B92A-4F4D-A3F1-A3F43CD39DAE@converseincode.com>
	<1502288526.1934.39.camel@linux.intel.com>
	<893c3fce-14cf-adbf-6613-1297b0334210@windriver.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Alpha release of check-requirement.sh
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
X-List-Received-Date: Thu, 10 Aug 2017 04:37:56 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Aug 9, 2017, at 11:32 AM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:
>=20
> On 2017-08-09 10:22 AM, Leonardo Sandoval wrote:
>> in my opinion, this fits nicely into the oe-core, into the
>> scripts/contrib folder.
>=20
> Agreed.

As far as living in scripts/contrib, you are certainly free to keep a =
copy there, but as it says on the webpage there is nothing specific to =
YP nor OE in it at the moment (other than the list of requirements), and =
I will likely be adding requirements for other projects.

And what I=E2=80=99m saying is that maintaining it is kinda what I=E2=80=99=
m already doing as a part of my course work (check-requirements is a =
side effect of that work).

> It would be nice to separate the data from the script so
> that people could easily add to it. That might make updates
> more difficult if the script is kept separate from oe-core.

Well, what you aren=E2=80=99t seeing is that data is separate; it=E2=80=99=
s all in arrays by requirement grouping. The script is also constructed =
from a series of smaller scripts catted together by a makefile; what =
you=E2=80=99re seeing is the output of a script build. I still need to =
push the git repo to github.

> Could you get rid of the references to 'course' if the script
> gets integrated:
> $ grep -i course ~/Downloads/check-requirements.sh | wc -l
> 139
>=20
> s/course/activity/ perhaps.

And the =E2=80=9Ccourse=E2=80=9D part is current attribute of the shared =
nature of the codebase; mostly variable names. I=E2=80=99d like to make =
that more generic, but it doesn=E2=80=99t hurt much right now. =
=E2=80=9CActivity=E2=80=9D is surely a possibility.

Please note I said it was an alpha release. I literally banged this =
together from ready-for.sh in about 8 hours. It is a work in progress. =
But worth sharing considering it=E2=80=99s pretty useful already.

I=E2=80=99d mostly be looking for bug reports as to =
packages/requirements to add to lists for various versions of distros.

It does occur to me that there may need to be a version of this per =
release of YP, but that=E2=80=99s for the future.

Behan=

