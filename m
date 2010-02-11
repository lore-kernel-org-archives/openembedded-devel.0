Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NfbZu-0005yI-5x
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 17:07:45 +0100
Received: by fxm27 with SMTP id 27so238920fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 08:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=6M1NInWhicPgnIOFa5VnQ+LFfvtqpimaSQKOAfVFQNM=;
	b=T0oS68zDG8cViJfQv6vGm9HasRznaPz2VA9QuTTumPiWHVyViFaoGD162V5cUgvkRD
	Je76yi+hyJVFSxRmbtjN0Pzy7dkk5EL00VWaKh3o8vg4rEVczxtAxPciNtBDKWwR0rIO
	nYsSyJk5qVWX0KA4g+nQfkaZJKJoScv7mgUKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=ePydbJ73jqtwgYYw6CAh5/jWUbf2je0pt72IiefiUTm9tH17WB+9H7oSiORmq06J86
	AbzUywj8MTGKOiXznyyiBYd9LSzgB/Loxnx7SlDA6PJ6FZq0Jn7kp2HYu4I7fgmzPZ9t
	f2WEZ7RuMLAvjKqUuelrWvr1uyjELa7cTlcWw=
MIME-Version: 1.0
Received: by 10.223.3.196 with SMTP id 4mr34971fao.63.1265904306045; Thu, 11 
	Feb 2010 08:05:06 -0800 (PST)
Date: Thu, 11 Feb 2010 17:05:05 +0100
Message-ID: <141020e31002110805je37961ey5739a551b65f3980@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Moving old broken EFL stuff to obsoleted Was: [oe-commits] Koen Kooi : efl: bump SRCREV for comp fixes
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
X-List-Received-Date: Thu, 11 Feb 2010 16:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
based on "removing recipes" policy:
http://wiki.openembedded.net/index.php/Upgrading_packages

Has moving to obsoleted as strict rules as removing? I expect that
many builders have obsoleted directory outside BBMASK and thus
ignoring that.

Today I asked for include that patch I pushed to oe.dev for epsilon
build on #edevelop.

16:33:46 < k-s> JaMa: epsilon is dead, avoid it
16:33:56 < k-s> JaMa: it's not about just compile errors, but structural er=
rors
16:34:19 < k-s> i know distros tend to like to keep cruft because "it
is already there", but in this case, just drop it
16:36:04 < k-s> canola is known to depend on it and etk, but at least
epsilon there is a patch to replace it with ethumb
16:38:41 < k-s> well, replacing with ethumb should be simple
16:38:43 < k-s> the apis are similar
16:40:57 < JaMa> k-s:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg03=
583.html
16:41:50 < JaMa> k-s: that omview in particular wasn't touched for
ages and I'm not in touch with previous developer.. so I was hoping
for simple patch for epsilon or drop omview
16:42:24 < k-s> drop omview
16:42:38 < k-s> okra was changing ephoto to be more embedded-friendly
16:42:53 < k-s> JaMa: you may want to ask okra some help and replace
omview with ephoto

EFL is developing pretty fast and avoiding bumping EFL_SRCREV because
some old cruft nobody is using anymore is really pity.

I understand that checking if something is used somewhere is damn hard
to check - for distros outside tree as policy also says.

What's the right compromise?

(I personally tend to like removal as nobody can already check all
versions agains all versions while building world)

Kind regards,

>> efl: bump SRCREV for comp fixes
>> -EFL_SRCREV ?=3D "45765"
>> +EFL_SRCREV ?=3D "45902"
>
> With this revision epsilon started to fail (python-epsilon was failing
> before too).
> http://tinderbox.openembedded.net/packages/epsilon/
> http://tinderbox.openembedded.net/packages/python-epsilon/
>
> I asked upstream devs on #edevel for simple fix and they said, that
> epsilon is so unsupported that they would rather move it from OLD/ to
> BROKEN/.
>
> What's right way to handle that in OE?
> Is it worth maintaining epsilon alive in oe.dev and asking upstream to
> include patches for epsilon or can we move epsilon + apps depending on
> it to obsoleted?
>
> We cannot bump ecore, because of epsilon which is pity. If we move
> epsilon to recipes/obsoleted then there is few apps still using that:
> e17/exhibit_svn.bb:DEPENDS =3D "evas ecore epsilon edje eet etk efreet"
> efl1/epdf/fix-plugin-path-check.patch: =A0 =A0requirements=3D"$requiremen=
ts
> epsilon imlib2"
> efl1/epsilon_svn.bb:FILES_${PN}-thumbd =3D "${bindir}/epsilon
> ${bindir}/epsilon_thumbd"
> efl1/esmart_svn.bb:DEPENDS =3D "evas ecore edje imlib2 epsilon libtool"
> efl1/ewl_svn.bb:DEPENDS =3D "evas ecore edje emotion efreet epsilon"
> omview/omview_svn.bb:DEPENDS +=3D " evas ewl epsilon"
> python/python-epsilon_svn.bb:DEPENDS +=3D "epsilon python-ecore"
> tasks/task-efl.bb: =A0epsilon \
> tasks/task-openmoko-feed.bb: =A0eet evas ecore embryo epsilon edje
> efreet emotion epdf \
> tasks/task-python-efl-examples.bb: =A0python-epsilon-examples \
> tasks/task-python-efl.bb: =A0python-epsilon \
>
> Regards,
>


