Received: from [193.74.71.22] (helo=guri.is.scarlet.be)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philippedeswert@scarlet.be>) id 1Ihmlv-0003gC-Vw
	for openembedded-devel@openembedded.org; Tue, 16 Oct 2007 15:48:00 +0200
Received: from (fuji.is.scarlet.be [193.74.71.41])
	by guri.is.scarlet.be  with ESMTP id l9GD2I002512;
	Tue, 16 Oct 2007 15:02:18 +0200
Date: Tue, 16 Oct 2007 15:02:18 +0200
Message-Id: <JQ09JU$226B655F90BD312D7F024131EBD56EA2@scarlet.be>
MIME-Version: 1.0
X-Sensitivity: 3
From: "Philippe De Swert" <philippedeswert@scarlet.be>
To: "openembedded-devel" <openembedded-devel@openembedded.org>
X-XaM3-API-Version: 4.1 (B54)
X-type: 0
X-SenderIP: 192.100.124.218
X-DCC-scarlet.be-Metrics: elist
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Patches to svn based recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2007 13:48:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all!


> Could people please stop doing stuff like:
> 
> openmoko-panel-bt_svn.bb: Drop panel-bluetooth.patch, as it was applied=
 upstream
> # delete "packages/openmoko-panel-plugins/files/panel-bluetooth.patch"
> 
> openmoko-dialer2_svn.bb : patch is now applied upstream
> - -SRC_URI +=3D "file://openmoko-dialer.patch;patch=3D1"
> 
> matchbox-keyboard: Bump svn revision and remove some patches in the bb =
file
> since these patches were applied upstream.
> - -        file://matchbox-keyboard-applet.patch;patch=3D1;pnum=3D0 \
> - -	file://matchbox-keyboard-hide-delay.patch;patch=3D1"
> 
> And use ;minrev=3D and ;maxrev=3D. Removing patches makes regression te=
sting and
building
> older versions impossible.

Ok. So all those things are forbidden. Good. So what are we expected to w=
rite
in the commit message then? It is usually much more useful to also specif=
y the
expected behaviour when listing the unwanted one.

Thanks,

Philippe=0A---=0AScarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...=0A=
http://www.scarlet.be/



