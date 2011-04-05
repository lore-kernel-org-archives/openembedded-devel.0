Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <srinredplano@gmail.com>) id 1Q7BPZ-0005Un-Rg
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 20:55:34 +0200
Received: by vxd7 with SMTP id 7so574557vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=xn7w/3kg4Ozg5MOFEb/tMO4eOLqsJHgItr/73HSM4G4=;
	b=tYPogye2JT1w4KhxJyIrKlJOzucJOTGOOlOREd86WFqEN6SlPIgU42NEoarAdm3jJr
	XJHKTUbWSeYEpe2i65wXQwfVAcmEyaepttCwWUINuvoOEmc5n/B1LL1YV3gBt1e/NQD7
	ILwW9iVCKCCdguNhKNmUs1yvL4CfTmhJfF4dw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SvzYpvl9bC0vZDg9QLEVIaO9ToY+hmmaUkVZ00cBS6MpK8p9nk/3j+Ssp5rpcxUONm
	JvjA1nAXwNIsHpdGYpKzFupnFrh+11R4rVhcYCVfAYJ4tkVHiLcGWIKBl1XwEer+B5Z8
	CjA9B9RPuR+DPjdET+9BKSvHdzccVN4gGK7u8=
MIME-Version: 1.0
Received: by 10.52.169.135 with SMTP id ae7mr74000vdc.79.1302029606945; Tue,
	05 Apr 2011 11:53:26 -0700 (PDT)
Received: by 10.220.201.76 with HTTP; Tue, 5 Apr 2011 11:53:26 -0700 (PDT)
Date: Tue, 5 Apr 2011 11:53:26 -0700
Message-ID: <BANLkTikmAU59dgxEwN7uHnr0DeupZvzKFA@mail.gmail.com>
From: srinredplano SP <srinredplano@gmail.com>
To: openembedded-devel@lists.openembedded.org, arago-devel@gforge.ti.com, 
	angstrom-distro-users@linuxtogo.org, openembedded-issues@linuxtogo.org
Subject: Building Gstreamer from GIT
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
X-List-Received-Date: Tue, 05 Apr 2011 18:55:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,
I am trying to build Gstreamer from GIT ( using branch 0.10.23 ) .But
I am not able to run autogen.sh due to missing .git  directory .

Can any one let me know why the . git is  getting erased and what I
should do to stop getting   that erased. (I am verymuch new to Git
(though I have build Gstreamer using svn)o build Gstreamer using GIt
Pointers for building Gstreamer using GIT  would be helpful.

Here is my recipe http://pastebin.com/tz6dsZmV . Thanks in Advance

gstreamer_0.10.30.bb
===================================================
require gstreamer.inc
PR = "r1"

SRCREV_pn-gstreamer = "${AUTOREV}"

SRC_URI[archive.md5sum] = "de01f73f71d97c5854badd363ca06509"
SRC_URI[archive.sha256sum] =
"e8ef301be423797ff36a0bb3615930b112b4175634051d19fd655e0ed974532a"

SRC_URI = "git://10.121.72.60/git/gstreamer.git;branch=0.10.23;protocol=git "

#SRC_URI = "git://anongit.freedesktop.org/gstreamer/common;branch=0.10.23;protocol=git
"


S = ${WORKDIR}/git

EXTRA_OECONF += "ac_cv_func_register_printf_function=no"

do_configure_prepend() {
    pushd ${S}
    tar -xzf ${DL_DIR}/git_10.121.72.60.git.gstreamer.git.tar.gz
    ./autogen.sh --noconfigure --nocheck

    sed -i -e s:docs::g Makefile.am
    popd
}


