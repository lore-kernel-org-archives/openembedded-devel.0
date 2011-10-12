Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <azarnasab@gmail.com>) id 1RE5n2-0004cm-50
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 22:52:36 +0200
Received: by bke11 with SMTP id 11so605130bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XSC5lT8dkoaYyZhZgb95cNqIk3eBDPEagpDekWxyWrM=;
	b=FKkt4HnFjgehmZQ33xd+sYiRRS7+15jtQeM3erEZp91gZd0VyDI0gysd//qkd6QSOy
	qRfTZCE5lU3daWnd9PqAP3+8XEolvIobt+ueWeaWGtb/HDM9q+QsX3Wk0M5kuCI9VGA2
	1fv4pAlfDAmc+1egVRCfoh3PnCq/aO/XIS2fk=
MIME-Version: 1.0
Received: by 10.204.129.6 with SMTP id m6mr519330bks.0.1318452413109; Wed, 12
	Oct 2011 13:46:53 -0700 (PDT)
Sender: azarnasab@gmail.com
Received: by 10.204.142.154 with HTTP; Wed, 12 Oct 2011 13:46:53 -0700 (PDT)
In-Reply-To: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
Date: Wed, 12 Oct 2011 14:46:53 -0600
X-Google-Sender-Auth: EpAcffI_wv81avlziAXiVwLxnjM
Message-ID: <CADWjqk598H9nE+StShm26eyWYOU-=W3ko-Nkgw1CAuxpjtdDWw@mail.gmail.com>
From: dashesy <dashesy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 20:52:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 6:22 AM, mgundes <mgcse@hotmail.com> wrote:
> =A0 Hi,
>
> =A0 I think one of the big issue with OE is build time. It does everythin=
g
> for you, so that it takes too much times. I want to minimize build time a=
nd
> realized that OE creates ipkgs for almost every package. If there is a wa=
y
> to prevent creation of ipkgs it would be really good for me. In my opinio=
n,
> it would be fine for other people too since usually rootfs directory is
> enough and ipkgs are not frequently used directly by developers.
>
Just as a suggestion:
1- You can start with a bare minimum rootfs then run it under qemu, or
even on the board itself
    Then you can use opkg to download/upgrade from the repositories,
or remove what you do not need. I guess this is the fastest method.
    I am thinking of putting together a build environment based on
user-mode qemu and opkg.
    I use fedora's kickstart files to build my desktop rootfs. That
would be great to have a similar approach using qemu and opkg.
    Specially for most people they do not need to compile the packages
themselves and the repositories are enough, they only need to compile
a few packages of their own.
2- You can only bitbake meta-toolchain to get a gcc with cross
compilation capability, then use that to build any package that you
want directly from sources without relying on OE.
    This is what I do myself right now, but you need to make sure the
dependencies are met.

If the dependencies of packages are correct and to the bare minimum
required (which should becase or it should be filed as a bug), OE will
be a better approach, it takes care of dependencies for you.
The only problem I have is that OE is hugely customizable, and takes
time to learn all different tricks to get exactly what I want in my
rootfs.
I am learning OE, for me I try to follow the mailing lists to learn
non-out-dated information as the first thing I learned was to that
most wikis are way outdated :)

For example, is there a way not to compile any -dbg packages?
I intuitively guess I need to set "release" in my local.conf but there
is no easier way than trying it and check if -dbg packages are created
or not.

> =A0 I have asked in freenode oe room but friends said there no way to do =
that
> in OE system. If there is no way to do that in current OE, do you plan to
> add as a feature?
>
> =A0 Thanks,
>
> Regards
>
> --
> MahmutG
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

dashesy


