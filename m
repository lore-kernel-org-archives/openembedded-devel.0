Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msundius@sundius.com>) id 1QI2un-0005GR-NN
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 20:04:41 +0200
Received: by qwh5 with SMTP id 5so1798099qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2011 11:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.131.23 with SMTP id v23mr1835705qcs.11.1304618521148; Thu,
	05 May 2011 11:02:01 -0700 (PDT)
Received: by 10.229.65.138 with HTTP; Thu, 5 May 2011 11:02:01 -0700 (PDT)
In-Reply-To: <9AFCD584B0B67B48AE8D8585BE30BA950116D58CCA@orsmsx504.amr.corp.intel.com>
References: <BANLkTi=FVHHE0+HjkhbRKy-z173cJGghog@mail.gmail.com>
	<9AFCD584B0B67B48AE8D8585BE30BA950116D58CCA@orsmsx504.amr.corp.intel.com>
Date: Thu, 5 May 2011 11:02:01 -0700
Message-ID: <BANLkTi=7OBSsL7DNr2ciU7NEVKYxwiU=Xw@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: "Zhang, Jessica" <jessica.zhang@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: building images
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
X-List-Received-Date: Thu, 05 May 2011 18:04:41 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2011 at 10:49 AM, Zhang, Jessica <jessica.zhang@intel.com>w=
rote:

>
> Yocto project has a command line script called adt-installer probably you
> can take a look, what it does is setup your host cross development
> environment.  It downloads the cross-toolchain for the target and downloa=
d
> the corresponding image rootfs and extract it out on the development host=
 as
> sysroot that contains the target headers and libraries.  The remote packa=
ge
> access is based on wget and it=92s using opkg to manipulate ipk packages =
since
> it=92s lightweighted.  The adt-installer is running against a installatio=
n
> config file basically tells it where (the ipk package repo) to download
> things and where (on the development host) to setup things, the toolchain=
,
> the sysroot etc.  So for the developer perspective, there=92s no dependen=
cy on
> OE.  What you need to do is to build out all the needed ipk packages usin=
g
> OE/Yocto and setup the ipk package repo.
>
>
>
Jessica,

I'm not sure if I replied to your email. Thank you. I think that is
generally what I've been after. I now have a bit of time and will look at i=
t
more closely.

Mike

