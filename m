Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LbzBO-0000zc-1E
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 16:26:54 +0100
Received: by rv-out-0708.google.com with SMTP id b17so2824636rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 07:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3wXZ6Gi4xNji7ORe8zI1831wEY8pbbKx9myZ6m9rdec=;
	b=JCu41eVVn+fLvXkPpNkrExAW9z9pph6Rh+S/S8bMlcsIHZfEczxi4zhGtKWcxHY4AZ
	b0Tp202VULrfHpQF7vcqUq77gv2s0TNnfD51b9u3s9vjpeUPh2bit3IvnEqelG+VzPlc
	cODty1JLUtqmhKMQhtEEXAnbqjLpEZxCqiPkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=CPnyrF16uWH6A9s9ygCIEdw1Uy2gYjLE7Bpa6OuCo9UBBSDmLh2ZeUfsqcWBCisz+k
	Hdc1cy66UnsZZJPcXerWI2RjzyN1BEL1pz8P6rcHq0kQ/Yko9vhUDFgWyaIjvnCMdKuC
	UMSGsPiWjlBGcc8v/YNi9u9iGzNWoCs3Nr/CQ=
MIME-Version: 1.0
Received: by 10.140.171.18 with SMTP id t18mr2654413rve.95.1235489031432; Tue, 
	24 Feb 2009 07:23:51 -0800 (PST)
In-Reply-To: <f46da1cf0902231625m260a7361ka4d8149040054972@mail.gmail.com>
References: <f46da1cf0902231625m260a7361ka4d8149040054972@mail.gmail.com>
Date: Tue, 24 Feb 2009 10:23:51 -0500
Message-ID: <f96d234e0902240723v2d407d17h4dc8dd2a634bc1d9@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] [Doc] getting_oe.xml: Update documentation.
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
X-List-Received-Date: Tue, 24 Feb 2009 15:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.  Can you reply with the no line wraps, or attach
the patch to an email as the following is corrupt?

I also have not figured out a good way to easily send patches through
gmail, so let me know when you figure it out :-)

Thanks,
Cliff

On Mon, Feb 23, 2009 at 7:25 PM, Theodore A. Roth <taroth@gmail.com> wrote:
> =A0* New section about directory structure.
> =A0* Update 'Getting BitBake' section.
>
> Signed-off-by: Theodore A. Roth <taroth@gmail.com>
>
> ---
> =A0usermanual/chapters/getting_oe.xml | =A0103 ++++++++++++++++++++++++++=
+++-------
> =A01 files changed, 83 insertions(+), 20 deletions(-)
>
> diff --git a/usermanual/chapters/getting_oe.xml
> b/usermanual/chapters/getting_oe.xml
> index 9238e4f..c7eb7ec 100644
> --- a/usermanual/chapters/getting_oe.xml
> +++ b/usermanual/chapters/getting_oe.xml
> @@ -2,30 +2,93 @@
> =A0<chapter id=3D"chapter_getting_oe">
> =A0 <title>Getting Started</title>
>
> + =A0<section id=3D"gettingoe_directory_setup">
> + =A0 =A0<title>OpenEmbedded Directory Structure</title>
> +
> + =A0 =A0<para>Before you begin downloading OpenEmbedded, you need to set=
up your
> + =A0 =A0working environment.</para>
> +
> + =A0 =A0 =A0 <para>The first step is to decide where on your system you =
wish to
> + =A0 =A0work. This document will use the <varname>$OEBASE</varname> vari=
able to
> + =A0 =A0denote the base directory of the OpenEmbedded environment. For
> + =A0 =A0example, <varname>$OEBASE</varname> could
> + =A0 =A0be <literal>/home/joe/work/oe</literal>.</para>
> +
> + =A0 =A0<para>The base directory of your OpenEmbedded environment
> + =A0 =A0(<varname>$OEBASE</varname>) is the location where sources will =
be checked
> + =A0 =A0out (or unpacked). You must choose a location with <emphasis>no =
symlinks
> + =A0 =A0above it</emphasis>.</para>
> +
> + =A0 =A0 =A0 <para>To create the directory structure:
> +
> + =A0 =A0<screen>
> +$ mkdir -p $OEBASE/build/conf
> +$ cd $OEBASE</screen>
> +
> + =A0 =A0 =A0 The <literal>$OEBASE/build</literal> directory will contain=
 your
> + =A0 =A0 =A0 local configurations and extensions to the OpenEmbedded sys=
tem which allow
> + =A0 =A0 =A0 you to build your applications and images.
> + =A0 =A0</para>
> +
> + =A0 =A0 =A0 <para>The <varname>$OEBASE</varname> will also contain both=
 bitbake/ and
> + =A0 =A0 =A0 openembedded/ directories. These will be discussed in
> + =A0 =A0 =A0 <xref linkend=3D"gettingoe_getting_bitbake"/> and
> + =A0 =A0 =A0 <xref linkend=3D"gettingoe_getting_oe"/>.
> + =A0 =A0 =A0 </para>
> + =A0</section>
> +
> =A0 <section id=3D"gettingoe_getting_bitbake">
> =A0 =A0 <title>Getting <application>BitBake</application></title>
>
> - =A0 =A0<para>The required version of <application>BitBake</application>=
 is
> - =A0 =A0changing rapidly. At the time of writing (end 2007)
> - =A0 =A0<application>BitBake</application> 1.8.latest was required.</par=
a>
> -
> - =A0 =A0<para>A safe method is to get the <application>BitBake</applicat=
ion> from
> - =A0 =A0a stable Subversion branch (those with an even minor number). <s=
creen>
> -<command>svn</command> co
> http://svn.berlios.de/svnroot/repos/bitbake/branches/bitbake-1.8
> -...
> -A =A0 bitbake-1.8/classes/base.bbclass
> -U =A0 bitbake-1.8
> -At revision 827.
> - =A0 =A0 =A0 =A0 =A0 =A0</screen> <application>BitBake</application> is =
checked out now;
> - =A0 =A0this completes the first and most critical dependency of OpenEmb=
edded.
> - =A0 =A0Issuing <command>svn</command> <command>up</command> in the
> - =A0 =A0<emphasis>bitbake-1.8</emphasis> directory will update
> - =A0 =A0<application>BitBake</application> to the latest stable version,=
 but
> - =A0 =A0generally it is a good idea to stick with a specific known worki=
ng version
> - =A0 =A0of <application>BitBake</application> until OpenEmbedded asks yo=
u to
> - =A0 =A0upgrade.</para>
> + =A0 =A0<para>Before using OE, you must first obtain the build tool it n=
eeds:
> + =A0 =A0bitbake.</para>
> +
> + =A0 =A0<para>It is recommended to run bitbake without installing it, as=
 a sibling
> + =A0 =A0directory of <literal>openembedded/</literal>
> + =A0 =A0and <literal>build/</literal> directories. Indeed, as bitbake is=
 written
> + =A0 =A0in python it does not need compilation for being used. You'll ju=
st have to
> + =A0 =A0set the PATH variable so that the BitBake tools are accessible (=
see
> + =A0 =A0<xref linkend=3D"gettingoe_configuring_oe"/>).</para>
> +
> + =A0 =A0 =A0 <section><title>Getting <application>BitBake</application> =
Using
> Subversion</title>
> + =A0 =A0 =A0 =A0 <para>To checkout the latest version of the BitBake 1.8=
 branch, use the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 following command:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 <screen>
> +$ cd $OEBASE
> +$ <command>svn</command> co
> svn://svn.berlios.de/bitbake/branches/bitbake-1.8/ bitbake
> +</screen>
> + =A0 =A0 =A0 =A0 </para>
> +
> + =A0 =A0 =A0 =A0 <para><application>BitBake</application> is checked out=
 now and
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 the <varname>$OEBASE</varname> directory wi=
ll contain
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 a <literal>bitbake/</literal> subdirectory.=
</para>
> +
> + =A0 =A0 =A0 =A0 <para>If you need to access a Subversion server through=
 a proxy, see the
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 <ulink url=3D"http://subversion.tigris.org/=
faq.html#proxy">SVN FAQ</ulink>
> + =A0 =A0 =A0 =A0 </para>
> + =A0 =A0 =A0 </section>
> +
> + =A0 =A0 =A0 <section><title>Updating <application>BitBake</application>=
</title>
> + =A0 =A0 =A0 =A0 <para>Bitbake is being revised fairly often. Periodical=
ly it's a good
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 idea to check the repository of bitbake sta=
ble branches to see if a
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 new stable branch is available or if the cu=
rrent branch has been
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 revised. Compare your existing bitbake dire=
ctory with the latest
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bitbake branch in the repository. Your exis=
ting bitbake branch and
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 its 'last changed revision' number can be f=
ound as follows:
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 <screen>$ cd $OEBASE/bitbake; svn info</scr=
een>
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 If there is a new stable branch, you will w=
ant to move or delete
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 your existing bitbake directory and repeat =
the process listed above
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 under "To obtain bitbake". If there is no n=
ew branch, it is easy to
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 update bitbake:
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 <screen>$ cd $OEBASE/bitbake; svn update</s=
creen>
> + =A0 =A0 =A0 =A0 </para>
> + =A0 =A0 =A0 </section>
> =A0 </section>
>
> +
> =A0 <section id=3D"gettingoe_getting_oe">
> =A0 =A0 <title>Getting OpenEmbedded</title>
>
> @@ -67,4 +130,4 @@ bitbake &lt;recipe_name&gt;
>
> =A0 =A0 <para>This section is a stub, help us by expanding it</para>
> =A0 </section>
> -</chapter>
> \ No newline at end of file
> +</chapter>
> --
> 1.5.4.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


