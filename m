Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id DFFFE7C603
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 17:39:29 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id q66so5975369ljq.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AhcGgFNmNSrgCKnJWDmgEm2laV1FpXP+TjQi8pA4wyM=;
	b=bYEjn2uVRoZsNmIKt0f6x2oJd0OwCjQZ3HQrNrha0eXwL3hNSKV0e+UYrfDKHFTmg2
	86rXFfbGGvQv8ewY9ZMiKyTehAY9NtMZtgqdmXfC0dQQ2e9uksW5GkUGRklnAw4T/BND
	Hx+xZUbX4yjAXPDNH01EqnYB4L3xS/tkANVD8ry2WHjeupESZzHC48YKI6SAoew+OzJb
	WMXC5MZNEV3nPwERGdT212x4KStPiV8SFSfNJwc/fefpTmo0bK3OdNB0crVfzT+ddaql
	SmE4deJO1qsrA1o49QbBGpWDsXFUsqOudwWLBstyQAvt8DoHz8e1DDMjLAv02wUDkDwM
	pnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AhcGgFNmNSrgCKnJWDmgEm2laV1FpXP+TjQi8pA4wyM=;
	b=NGkP1bCnNdZERrHvGjLo3kC/PuJGqt0bHZ+KnM2KiOFY6S7nH3KbKDs9sM9dmraAiv
	6UfS456D7woZlCDqBENj/YnbGHdMifNxJ0qihBuF4iBTgOjRRJXbfvWOzq5klL0K6pvf
	wx25YCMTxpy7Rf5X075xOM0BNCNsZlP7HuhiDOKmBp5vAx0pdNG/052ggWXPUboz0xf3
	4YQdsXxhy0UKi2RkMy/CNEfbBbmJ+y1f2hK8/KqIBYTi50BmPGmjEe/42U2+hAxsWbE4
	nIwVtz9R7VCwIQWesV2Xy4ZbrQvMudDwaGknviDJ9OjOhRI3ojz2R48AR0LpU129OGuZ
	mwzg==
X-Gm-Message-State: APjAAAWmyskDnk/uqSwTW3X8kKOnjedlvg4oaeIGtsbh9QG92+Ntn4VE
	sdkghfH01El2LQ5V0ALHhUFFoBJ6QxnGsq5cpvY=
X-Google-Smtp-Source: APXvYqzeBeX0u4WRrkRlzXsqcH8vWXYoRg47/K9QPLAVANPEdBXTbYzrIwTCBPbqVEtB5vP/SSzpNwTBd2lcb0Ot9rE=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr43368ljj.28.1554485970365;
	Fri, 05 Apr 2019 10:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190403232520.27463-1-alistair.francis@wdc.com>
	<20190403232520.27463-6-alistair.francis@wdc.com>
	<CAKmqyKN0TPKUxeLnueWmA=zHKKh14ST1c0dZoRNEdL-a6xeG3g@mail.gmail.com>
	<CAMKF1sopTu1y5A_esGBjHd8pEUZh2aX6OMrdPkSWgDpyPvJKAQ@mail.gmail.com>
In-Reply-To: <CAMKF1sopTu1y5A_esGBjHd8pEUZh2aX6OMrdPkSWgDpyPvJKAQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Apr 2019 10:38:02 -0700
Message-ID: <CAKmqyKNBXz+UGggqgZQk7UGLwgzDxXPORTFob2jm_jnHBRW-zA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 6/6] mycroft: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 17:39:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2019 at 10:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Apr 5, 2019 at 7:44 AM Alistair Francis <alistair23@gmail.com> wr=
ote:
> >
> > On Wed, Apr 3, 2019 at 4:26 PM Alistair Francis
> > <Alistair.Francis@wdc.com> wrote:
> > >
> > > Mycroft is an open source speech assistant. It traditionally runs ins=
ide
> > > Python virtual env and installs all of the pip and native packages an=
d
> > > programs that is needs at setup. This generally includes a native gcc
> > > build for some of the binaries in the pip packages.
> > >
> > > This patch adds Mycroft support and edits the source to remove the
> > > Python venv usage so we can just run in standard Python world. This
> > > allows us to use the preinstalled Python packages where avaliable and
> > > avoid installing too much on the target at runtime. At the moment we
> > > still require a few simple Python packages to be installed but we don=
't
> > > requrie any target compilation.
> > >
> > > Hopefully in the future we can remove all of the runtime install
> > > requirements by adding all the Python packages to the rootFS pre-boot
> > > and setting up the other files/directories as required during the bui=
ld
> > > process.
> > >
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > I have sent a v2, it only affects this patch (patch 6). It changes it
> > to setup Mycroft on the first boot instead of forcing the user to
> > manually do it.
> >
>
> thanks I have take v2 series

Thanks! I send a v3 of patch 2 ([PATCH v3 2/6] libfann: Initial
commit) that addresses Richard's comment of not using AUTOREV.

Alistair

>
> > Alistair
> >
> > > ---
> > >  .../files/0001-Remove-python-venv.patch       | 192 ++++++++++++++++=
++
> > >  ...irements-Remove-ones-installed-by-OE.patch |  62 ++++++
> > >  ...3-and-pip3-instead-of-python-and-pip.patch | 135 ++++++++++++
> > >  ...v_setup.sh-Remove-the-git-dependency.patch |  48 +++++
> > >  ....sh-Remove-the-test-setup-dependency.patch |  31 +++
> > >  .../mycroft/files/mycroft.service             |  13 ++
> > >  .../mycroft/mycroft_19.2.2.bb                 |  61 ++++++
> > >  7 files changed, 542 insertions(+)
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
0001-Remove-python-venv.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
0002-pip-requirements-Remove-ones-installed-by-OE.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
0003-Use-python3-and-pip3-instead-of-python-and-pip.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
0004-dev_setup.sh-Remove-the-git-dependency.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
0005-dev_setup.sh-Remove-the-test-setup-dependency.patch
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/=
mycroft.service
> > >  create mode 100644 meta-multimedia/recipes-multimedia/mycroft/mycrof=
t_19.2.2.bb
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Re=
move-python-venv.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0=
001-Remove-python-venv.patch
> > > new file mode 100644
> > > index 000000000..c03bccd3d
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-py=
thon-venv.patch
> > > @@ -0,0 +1,192 @@
> > > +From 6272f36080bd440a5825b526f4c06223c5bb9fbb Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Mon, 18 Mar 2019 16:30:45 -0700
> > > +Subject: [PATCH 1/5] Remove python venv
> > > +
> > > +Remove the python venv requirements and instead just use the native
> > > +python and pip pacakges.
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +---
> > > + dev_setup.sh     | 36 ------------------------------------
> > > + start-mycroft.sh | 13 -------------
> > > + venv-activate.sh | 44 +-------------------------------------------
> > > + 3 files changed, 1 insertion(+), 92 deletions(-)
> > > +
> > > +diff --git a/dev_setup.sh b/dev_setup.sh
> > > +index e0b07bf25cf..aed54b2167a 100755
> > > +--- a/dev_setup.sh
> > > ++++ b/dev_setup.sh
> > > +@@ -310,18 +310,6 @@ function install_deps() {
> > > +     fi
> > > + }
> > > +
> > > +-VIRTUALENV_ROOT=3D${VIRTUALENV_ROOT:-"${TOP}/.venv"}
> > > +-
> > > +-function install_venv() {
> > > +-    ${opt_python} -m venv "${VIRTUALENV_ROOT}/" --without-pip
> > > +-    # Force version of pip for reproducability, but there is nothin=
g special
> > > +-    # about this version.  Update whenever a new version is release=
d and
> > > +-    # verified functional.
> > > +-    curl https://bootstrap.pypa.io/3.3/get-pip.py | "${VIRTUALENV_R=
OOT}/bin/python" - 'pip=3D=3D18.0.0'
> > > +-    # Function status depending on if pip exists
> > > +-    [ -x "${VIRTUALENV_ROOT}/bin/pip" ]
> > > +-}
> > > +-
> > > + install_deps
> > > +
> > > + # Configure to use the standard commit template for
> > > +@@ -355,15 +343,7 @@ else
> > > +     fi
> > > + fi
> > > +
> > > +-if [ ! -x "${VIRTUALENV_ROOT}/bin/activate" ] ; then
> > > +-    if ! install_venv ; then
> > > +-        echo "Failed to set up virtualenv for mycroft, exiting setu=
p."
> > > +-        exit 1
> > > +-    fi
> > > +-fi
> > > +-
> > > + # Start the virtual environment
> > > +-source "${VIRTUALENV_ROOT}/bin/activate"
> > > + cd "${TOP}"
> > > +
> > > + # Install pep8 pre-commit hook
> > > +@@ -380,22 +360,6 @@ fi
> > > +
> > > + PYTHON=3D$( python -c "import sys;print('python{}.{}'.format(sys.ve=
rsion_info[0], sys.version_info[1]))" )
> > > +
> > > +-# Add mycroft-core to the virtualenv path
> > > +-# (This is equivalent to typing 'add2virtualenv $TOP', except
> > > +-# you can't invoke that shell function from inside a script)
> > > +-VENV_PATH_FILE=3D"${VIRTUALENV_ROOT}/lib/$PYTHON/site-packages/_vir=
tualenv_path_extensions.pth"
> > > +-if [ ! -f "$VENV_PATH_FILE" ] ; then
> > > +-    echo "import sys; sys.__plen =3D len(sys.path)" > "$VENV_PATH_F=
ILE" || return 1
> > > +-    echo "import sys; new=3Dsys.path[sys.__plen:]; del sys.path[sys=
.__plen:]; p=3Dgetattr(sys,'__egginsert',0); sys.path[p:p]=3Dnew; sys.__egg=
insert =3D p+len(new)" >> "$VENV_PATH_FILE" || return 1
> > > +-fi
> > > +-
> > > +-if ! grep -q "$TOP" $VENV_PATH_FILE ; then
> > > +-    echo "Adding mycroft-core to virtualenv path"
> > > +-    sed -i.tmp '1 a\
> > > +-'"$TOP"'
> > > +-' "${VENV_PATH_FILE}"
> > > +-fi
> > > +-
> > > + # install required python modules
> > > + if ! pip install -r requirements.txt ; then
> > > +     echo "Warning: Failed to install all requirements. Continue? y/=
N"
> > > +diff --git a/start-mycroft.sh b/start-mycroft.sh
> > > +index b9514a61ba5..64e0216a62f 100755
> > > +--- a/start-mycroft.sh
> > > ++++ b/start-mycroft.sh
> > > +@@ -20,7 +20,6 @@ script=3D${0}
> > > + script=3D${script##*/}
> > > + cd -P "$( dirname "$SOURCE" )"
> > > + DIR=3D"$( pwd )"
> > > +-VIRTUALENV_ROOT=3D${VIRTUALENV_ROOT:-"${DIR}/.venv"}
> > > +
> > > + function help() {
> > > +     echo "${script}:  Mycroft command/service launcher"
> > > +@@ -76,19 +75,11 @@ function name-to-script-path() {
> > > +     esac
> > > + }
> > > +
> > > +-function source-venv() {
> > > +-    # Enter Python virtual environment, unless under Docker
> > > +-    if [ ! -f "/.dockerenv" ] ; then
> > > +-        source ${VIRTUALENV_ROOT}/bin/activate
> > > +-    fi
> > > +-}
> > > +-
> > > + first_time=3Dtrue
> > > + function init-once() {
> > > +     if ($first_time) ; then
> > > +         echo "Initializing..."
> > > +         "${DIR}/scripts/prepare-msm.sh"
> > > +-        source-venv
> > > +         first_time=3Dfalse
> > > +     fi
> > > + }
> > > +@@ -225,15 +216,12 @@ case ${_opt} in
> > > +     #    launch-background ${_opt}
> > > +     #    ;;
> > > +     "unittest")
> > > +-        source-venv
> > > +         pytest test/unittests/ --cov=3Dmycroft "$@"
> > > +         ;;
> > > +     "singleunittest")
> > > +-        source-venv
> > > +         pytest "$@"
> > > +         ;;
> > > +     "skillstest")
> > > +-        source-venv
> > > +         pytest test/integrationtests/skills/discover_tests.py "$@"
> > > +         ;;
> > > +     "audiotest")
> > > +@@ -243,7 +231,6 @@ case ${_opt} in
> > > +         launch-process ${_opt}
> > > +         ;;
> > > +     "sdkdoc")
> > > +-        source-venv
> > > +         cd doc
> > > +         make ${opt}
> > > +         cd ..
> > > +diff --git a/venv-activate.sh b/venv-activate.sh
> > > +index d1e7bcb44e7..10b46d4de3b 100644
> > > +--- a/venv-activate.sh
> > > ++++ b/venv-activate.sh
> > > +@@ -22,49 +22,7 @@
> > > +
> > > + # wrap in function to allow local variables, since this file will b=
e source'd
> > > + function main() {
> > > +-    local quiet=3D0
> > > +-
> > > +-    for arg in "$@"
> > > +-    do
> > > +-        case $arg in
> > > +-            "-q"|"--quiet" )
> > > +-               quiet=3D1
> > > +-               ;;
> > > +-
> > > +-            "-h"|"--help" )
> > > +-               echo "venv-activate.sh:  Enter the Mycroft virtual e=
nvironment"
> > > +-               echo "Usage:"
> > > +-               echo "   source venv-activate.sh"
> > > +-               echo "or"
> > > +-               echo "   . venv-activate.sh"
> > > +-               echo ""
> > > +-               echo "Options:"
> > > +-               echo "   -q | --quiet    Don't show instructions."
> > > +-               echo "   -h | --help    Show help."
> > > +-               return 0
> > > +-               ;;
> > > +-
> > > +-            *)
> > > +-               echo "ERROR:  Unrecognized option: $@"
> > > +-               return 1
> > > +-               ;;
> > > +-       esac
> > > +-    done
> > > +-
> > > +-    if [ "$0" =3D=3D "$BASH_SOURCE" ] ; then
> > > +-        # Prevent running in script then exiting immediately
> > > +-        echo "ERROR: Invoke with 'source venv-activate.sh' or '. ve=
nv-activate.sh'"
> > > +-    else
> > > +-        local SRC_DIR=3D"$( builtin cd "$( dirname "${BASH_SOURCE}"=
 )" ; pwd -P )"
> > > +-        source ${SRC_DIR}/.venv/bin/activate
> > > +-
> > > +-        # Provide an easier to find "mycroft-" prefixed command.
> > > +-        unalias mycroft-venv-activate 2>/dev/null
> > > +-        alias mycroft-venv-deactivate=3D"deactivate && unalias mycr=
oft-venv-deactivate 2>/dev/null && alias mycroft-venv-activate=3D\"source '=
${SRC_DIR}/venv-activate.sh'\""
> > > +-        if [ $quiet -eq 0 ] ; then
> > > +-            echo "Entering Mycroft virtual environment.  Run 'mycro=
ft-venv-deactivate' to exit"
> > > +-        fi
> > > +-    fi
> > > ++   echo "Not entering Python VENV"
> > > + }
> > > +
> > > + main $@
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0002-pi=
p-requirements-Remove-ones-installed-by-OE.patch b/meta-multimedia/recipes-=
multimedia/mycroft/files/0002-pip-requirements-Remove-ones-installed-by-OE.=
patch
> > > new file mode 100644
> > > index 000000000..ca79d00b4
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/0002-pip-requi=
rements-Remove-ones-installed-by-OE.patch
> > > @@ -0,0 +1,62 @@
> > > +From 142bc3912ea9e1a4ecf4db0e2bec3049aa416464 Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Tue, 19 Mar 2019 13:32:54 -0700
> > > +Subject: [PATCH 2/5] pip requirements: Remove ones installed by OE
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +---
> > > + requirements.txt      | 14 --------------
> > > + test-requirements.txt |  1 -
> > > + 2 files changed, 15 deletions(-)
> > > +
> > > +diff --git a/requirements.txt b/requirements.txt
> > > +index 7e4faf48182..29536e990ac 100644
> > > +--- a/requirements.txt
> > > ++++ b/requirements.txt
> > > +@@ -1,20 +1,10 @@
> > > +-six=3D=3D1.10.0
> > > +-requests=3D=3D2.20.0
> > > + gTTS=3D=3D2.0.3
> > > + gTTS-token=3D=3D1.1.3
> > > +-PyAudio=3D=3D0.2.11
> > > + pyee=3D=3D5.0.0
> > > + SpeechRecognition=3D=3D3.8.1
> > > +-tornado=3D=3D4.5.3
> > > + websocket-client=3D=3D0.54.0
> > > + requests-futures=3D=3D0.9.5
> > > +-pyalsaaudio=3D=3D0.8.2
> > > + xmlrunner=3D=3D1.7.7
> > > +-pyserial=3D=3D3.0
> > > +-psutil=3D=3D5.2.1
> > > +-pocketsphinx=3D=3D0.1.0
> > > +-inflection=3D=3D0.3.1
> > > +-pillow=3D=3D4.1.1
> > > + python-dateutil=3D=3D2.6.0
> > > + pychromecast=3D=3D0.7.7
> > > + python-vlc=3D=3D1.1.2
> > > +@@ -26,10 +16,6 @@ msm=3D=3D0.7.3
> > > + msk=3D=3D0.3.12
> > > + adapt-parser=3D=3D0.3.2
> > > + padatious=3D=3D0.4.6
> > > +-fann2=3D=3D1.0.7
> > > + padaos=3D=3D0.1.9
> > > + precise-runner=3D=3D0.2.1
> > > + petact=3D=3D0.1.2
> > > +-
> > > +-# dev setup tools
> > > +-pep8=3D=3D1.7.0
> > > +diff --git a/test-requirements.txt b/test-requirements.txt
> > > +index 8ada8157c95..eb4e364a9b4 100644
> > > +--- a/test-requirements.txt
> > > ++++ b/test-requirements.txt
> > > +@@ -1,6 +1,5 @@
> > > + pep8=3D=3D1.7.0
> > > + coveralls=3D=3D1.5.0
> > > +-pytest=3D=3D3.5.0
> > > + pytest-cov=3D=3D2.5.1
> > > + cov-core=3D=3D1.15.0
> > > + mock=3D=3D2.0.0
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0003-Us=
e-python3-and-pip3-instead-of-python-and-pip.patch b/meta-multimedia/recipe=
s-multimedia/mycroft/files/0003-Use-python3-and-pip3-instead-of-python-and-=
pip.patch
> > > new file mode 100644
> > > index 000000000..a1f04b4b4
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/0003-Use-pytho=
n3-and-pip3-instead-of-python-and-pip.patch
> > > @@ -0,0 +1,135 @@
> > > +From 87b94e54fefa1f83b41030444fc87b421c97b2c5 Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Tue, 19 Mar 2019 13:38:44 -0700
> > > +Subject: [PATCH 3/5] Use python3 and pip3 instead of python and pip
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +---
> > > + bin/mycroft-cli-client          |  2 +-
> > > + bin/mycroft-pip                 |  2 +-
> > > + bin/mycroft-say-to              |  2 +-
> > > + bin/mycroft-skill-testrunner    |  4 ++--
> > > + bin/mycroft-speak               |  2 +-
> > > + dev_setup.sh                    | 10 +++++-----
> > > + scripts/install-pocketsphinx.sh |  2 +-
> > > + 7 files changed, 12 insertions(+), 12 deletions(-)
> > > +
> > > +diff --git a/bin/mycroft-cli-client b/bin/mycroft-cli-client
> > > +index f40a316e3f6..de2040d9e67 100755
> > > +--- a/bin/mycroft-cli-client
> > > ++++ b/bin/mycroft-cli-client
> > > +@@ -21,4 +21,4 @@ DIR=3D"$( dirname "$SOURCE" )"
> > > + source "$DIR/../venv-activate.sh" -q
> > > +
> > > + # Invoke the Command Line Interface
> > > +-python -m mycroft.client.text $@
> > > ++python3 -m mycroft.client.text $@
> > > +diff --git a/bin/mycroft-pip b/bin/mycroft-pip
> > > +index a42b16b847a..81bd5bfb3cf 100755
> > > +--- a/bin/mycroft-pip
> > > ++++ b/bin/mycroft-pip
> > > +@@ -21,4 +21,4 @@ DIR=3D"$( dirname "$SOURCE" )"
> > > + source "$DIR/../venv-activate.sh" -q
> > > +
> > > + # Install pip packages within the Mycroft venv
> > > +-pip $@
> > > +\ No newline at end of file
> > > ++pip3 $@
> > > +\ No newline at end of file
> > > +diff --git a/bin/mycroft-say-to b/bin/mycroft-say-to
> > > +index 964e16eb0c5..5575969715c 100755
> > > +--- a/bin/mycroft-say-to
> > > ++++ b/bin/mycroft-say-to
> > > +@@ -22,4 +22,4 @@ DIR=3D"$( pwd )"
> > > + source "$DIR/../venv-activate.sh" -q
> > > +
> > > + # Send a message to be spoken
> > > +-output=3D$(python -m mycroft.messagebus.send "recognizer_loop:utter=
ance"  "{\"utterances\": [\"$@\"], \"lang\": \"en-us\"}")
> > > ++output=3D$(python3 -m mycroft.messagebus.send "recognizer_loop:utte=
rance"  "{\"utterances\": [\"$@\"], \"lang\": \"en-us\"}")
> > > +diff --git a/bin/mycroft-skill-testrunner b/bin/mycroft-skill-testru=
nner
> > > +index 9699a4d138f..282f5ca65b0 100755
> > > +--- a/bin/mycroft-skill-testrunner
> > > ++++ b/bin/mycroft-skill-testrunner
> > > +@@ -22,7 +22,7 @@ source "$DIR/../venv-activate.sh" -q
> > > +
> > > + # Invoke the individual skill tester
> > > + if [ "$#" -eq 0 ] ; then
> > > +-    python -m test.integrationtests.skills.runner .
> > > ++    python3 -m test.integrationtests.skills.runner .
> > > + else
> > > +-    python -m test.integrationtests.skills.runner $@
> > > ++    python3 -m test.integrationtests.skills.runner $@
> > > + fi
> > > +\ No newline at end of file
> > > +diff --git a/bin/mycroft-speak b/bin/mycroft-speak
> > > +index 51facf29189..c65556f1173 100755
> > > +--- a/bin/mycroft-speak
> > > ++++ b/bin/mycroft-speak
> > > +@@ -22,4 +22,4 @@ DIR=3D"$( pwd )"
> > > + source "$DIR/../venv-activate.sh" -q
> > > +
> > > + # Send a message to be spoken
> > > +-output=3D$(python -m mycroft.messagebus.send "speak"  "{\"utterance=
\": \"$@\"}")
> > > +\ No newline at end of file
> > > ++output=3D$(python3 -m mycroft.messagebus.send "speak"  "{\"utteranc=
e\": \"$@\"}")
> > > +\ No newline at end of file
> > > +diff --git a/dev_setup.sh b/dev_setup.sh
> > > +index aed54b2167a..dd391181f19 100755
> > > +--- a/dev_setup.sh
> > > ++++ b/dev_setup.sh
> > > +@@ -48,7 +48,7 @@ param=3D""
> > > +
> > > + for var in "$@" ; do
> > > +     # Check if parameter should be read
> > > +-    if [[ ${param} =3D=3D "python" ]] ; then
> > > ++    if [[ ${param} =3D=3D "python3" ]] ; then
> > > +         opt_python=3D${var}
> > > +         param=3D""
> > > +         continue
> > > +@@ -351,17 +351,17 @@ if [ -z ${INSTALL_PRECOMMIT_HOOK} ] ; then
> > > +     HOOK_FILE=3D"./.git/hooks/pre-commit"
> > > +     if [ ! -f ${HOOK_FILE} ] || grep -q "MYCROFT DEV SETUP" ${HOOK_=
FILE} ; then
> > > +         echo "Installing PEP8 check as precommit-hook"
> > > +-        echo "#! $( which python )" > ${HOOK_FILE}
> > > ++        echo "#! $( which python3 )" > ${HOOK_FILE}
> > > +         echo "# MYCROFT DEV SETUP" >> ${HOOK_FILE}
> > > +         cat ./scripts/pre-commit >> ${HOOK_FILE}
> > > +         chmod +x ${HOOK_FILE}
> > > +     fi
> > > + fi
> > > +
> > > +-PYTHON=3D$( python -c "import sys;print('python{}.{}'.format(sys.ve=
rsion_info[0], sys.version_info[1]))" )
> > > ++PYTHON=3D$( python3 -c "import sys;print('python{}.{}'.format(sys.v=
ersion_info[0], sys.version_info[1]))" )
> > > +
> > > + # install required python modules
> > > +-if ! pip install -r requirements.txt ; then
> > > ++if ! pip3 install -r requirements.txt ; then
> > > +     echo "Warning: Failed to install all requirements. Continue? y/=
N"
> > > +     read -n1 continue
> > > +     if [[ "$continue" !=3D "y" ]] ; then
> > > +@@ -369,7 +369,7 @@ if ! pip install -r requirements.txt ; then
> > > +     fi
> > > + fi
> > > +
> > > +-if ! pip install -r test-requirements.txt ; then
> > > ++if ! pip3 install -r test-requirements.txt ; then
> > > +     echo "Warning test requirements wasn't installed, Note: normal =
operation should still work fine..."
> > > + fi
> > > +
> > > +diff --git a/scripts/install-pocketsphinx.sh b/scripts/install-pocke=
tsphinx.sh
> > > +index 44d329b7985..d45f5c22747 100755
> > > +--- a/scripts/install-pocketsphinx.sh
> > > ++++ b/scripts/install-pocketsphinx.sh
> > > +@@ -47,7 +47,7 @@ function install_pocketsphinx() {
> > > +
> > > +     # build and install pocketsphinx python bindings
> > > +     cd ${TOP}/pocketsphinx-python
> > > +-    python setup.py install
> > > ++    python3 setup.py install
> > > + }
> > > +
> > > + if [ "$1" =3D "-q" ] ; then
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-de=
v_setup.sh-Remove-the-git-dependency.patch b/meta-multimedia/recipes-multim=
edia/mycroft/files/0004-dev_setup.sh-Remove-the-git-dependency.patch
> > > new file mode 100644
> > > index 000000000..b7ca16013
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup=
.sh-Remove-the-git-dependency.patch
> > > @@ -0,0 +1,48 @@
> > > +From a480dde949f820fda6e46c13261883e851f5a430 Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Fri, 29 Mar 2019 16:09:57 -0700
> > > +Subject: [PATCH 4/5] dev_setup.sh: Remove the git dependency
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +---
> > > + dev_setup.sh | 16 ----------------
> > > + 1 file changed, 16 deletions(-)
> > > +
> > > +diff --git a/dev_setup.sh b/dev_setup.sh
> > > +index dd391181f19..c6aa783e1ef 100755
> > > +--- a/dev_setup.sh
> > > ++++ b/dev_setup.sh
> > > +@@ -312,10 +312,6 @@ function install_deps() {
> > > +
> > > + install_deps
> > > +
> > > +-# Configure to use the standard commit template for
> > > +-# this repo only.
> > > +-git config commit.template .gitmessage
> > > +-
> > > + # Check whether to build mimic (it takes a really long time!)
> > > + build_mimic=3D"n"
> > > + if [[ ${opt_forcemimicbuild} =3D=3D true ]] ; then
> > > +@@ -346,18 +342,6 @@ fi
> > > + # Start the virtual environment
> > > + cd "${TOP}"
> > > +
> > > +-# Install pep8 pre-commit hook
> > > +-if [ -z ${INSTALL_PRECOMMIT_HOOK} ] ; then
> > > +-    HOOK_FILE=3D"./.git/hooks/pre-commit"
> > > +-    if [ ! -f ${HOOK_FILE} ] || grep -q "MYCROFT DEV SETUP" ${HOOK_=
FILE} ; then
> > > +-        echo "Installing PEP8 check as precommit-hook"
> > > +-        echo "#! $( which python3 )" > ${HOOK_FILE}
> > > +-        echo "# MYCROFT DEV SETUP" >> ${HOOK_FILE}
> > > +-        cat ./scripts/pre-commit >> ${HOOK_FILE}
> > > +-        chmod +x ${HOOK_FILE}
> > > +-    fi
> > > +-fi
> > > +-
> > > + PYTHON=3D$( python3 -c "import sys;print('python{}.{}'.format(sys.v=
ersion_info[0], sys.version_info[1]))" )
> > > +
> > > + # install required python modules
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0005-de=
v_setup.sh-Remove-the-test-setup-dependency.patch b/meta-multimedia/recipes=
-multimedia/mycroft/files/0005-dev_setup.sh-Remove-the-test-setup-dependenc=
y.patch
> > > new file mode 100644
> > > index 000000000..5ae868376
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/0005-dev_setup=
.sh-Remove-the-test-setup-dependency.patch
> > > @@ -0,0 +1,31 @@
> > > +From 7fc38ae0dec30789fa0d365f1764f4950b700a98 Mon Sep 17 00:00:00 20=
01
> > > +From: Alistair Francis <alistair.francis@wdc.com>
> > > +Date: Tue, 2 Apr 2019 16:52:44 -0700
> > > +Subject: [PATCH 5/5] dev_setup.sh: Remove the test setup dependency
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +Upstream-Status: Inappropriate [embedded specific]
> > > +
> > > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > +---
> > > + dev_setup.sh | 4 ----
> > > + 1 file changed, 4 deletions(-)
> > > +
> > > +diff --git a/dev_setup.sh b/dev_setup.sh
> > > +index c6aa783e1ef..bcfaa0c16c2 100755
> > > +--- a/dev_setup.sh
> > > ++++ b/dev_setup.sh
> > > +@@ -353,10 +353,6 @@ if ! pip3 install -r requirements.txt ; then
> > > +     fi
> > > + fi
> > > +
> > > +-if ! pip3 install -r test-requirements.txt ; then
> > > +-    echo "Warning test requirements wasn't installed, Note: normal =
operation should still work fine..."
> > > +-fi
> > > +-
> > > + SYSMEM=3D$( free | awk '/^Mem:/ { print $2 }' )
> > > + MAXCORES=3D$(($SYSMEM / 512000))
> > > + MINCORES=3D1
> > > +--
> > > +2.21.0
> > > +
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft=
.service b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
> > > new file mode 100644
> > > index 000000000..2d7085795
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.servic=
e
> > > @@ -0,0 +1,13 @@
> > > +[Unit]
> > > +Description=3DMycroft
> > > +DefaultDependencies=3Dno
> > > +After=3Dsystemd-user-sessions.service plymouth-quit.service systemd-=
logind.service
> > > +
> > > +[Service]
> > > +Type=3Dforking
> > > +ExecStartPre=3Dmkdir -p /var/log/mycroft
> > > +ExecStart=3D@LIBDIR@/mycroft/start-mycroft.sh all
> > > +ExecStop=3D@LIBDIR@/mycroft/stop-mycroft.sh all
> > > +
> > > +[Install]
> > > +WantedBy=3Dmulti-user.target
> > > diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.=
2.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.2.bb
> > > new file mode 100644
> > > index 000000000..d9b3146bc
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.2.bb
> > > @@ -0,0 +1,61 @@
> > > +SUMMARY =3D "Mycroft is a hackable open source voice assistant."
> > > +DESCRIPTION =3D "Mycroft is the world=E2=80=99s first open source as=
sistant. "
> > > +HOMEPAGE =3D "https://mycroft.ai/"
> > > +SECTION =3D "multimedia"
> > > +
> > > +LICENSE =3D "Apache-2.0"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D79aa497b11564d1d419ee8=
89e7b498f6"
> > > +
> > > +SRCREV =3D "6706c377820912f83c1838d9eb32950ca9e39ec7"
> > > +SRC_URI =3D "git://github.com/MycroftAI/mycroft-core.git;branch=3Dma=
ster \
> > > +           file://0001-Remove-python-venv.patch \
> > > +           file://0002-pip-requirements-Remove-ones-installed-by-OE.=
patch \
> > > +           file://0003-Use-python3-and-pip3-instead-of-python-and-pi=
p.patch \
> > > +           file://0004-dev_setup.sh-Remove-the-git-dependency.patch =
\
> > > +           file://0005-dev_setup.sh-Remove-the-test-setup-dependency=
.patch \
> > > +           file://mycroft.service \
> > > +          "
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +inherit systemd
> > > +
> > > +# Mycroft installs itself on the host
> > > +# Just copy the setup files to the rootfs
> > > +do_install() {
> > > +    install -d ${D}${libdir}/
> > > +    cp -r ${B} ${D}${libdir}/mycroft
> > > +    rm -r ${D}${libdir}/mycroft/.git
> > > +
> > > +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f=
alse', d)}; then
> > > +        install -d ${D}${systemd_unitdir}/system
> > > +        install -m 644 ${WORKDIR}/mycroft.service ${D}${systemd_unit=
dir}/system
> > > +        sed -i -e 's,@LIBDIR@,${libdir},g' ${D}${systemd_unitdir}/sy=
stem/mycroft.service
> > > +    fi
> > > +}
> > > +
> > > +FILES_${PN} +=3D "${libdir}/mycroft"
> > > +
> > > +RDEPENDS_${PN} =3D "python3"
> > > +
> > > +# Install as many Python packages as we can.
> > > +# We don't yet have all the packages in meta-python.
> > > +# Install as many as we can and we will install the rest on the targ=
et with pip.
> > > +# TODO: Add all the remaining packages and remove pip
> > > +RDEPENDS_${PN} +=3D "python3-pip \
> > > +                   python3-requests python3-pillow \
> > > +                   python3-tornado python3-pyyaml \
> > > +                   python3-pyalsaaudio python3-inflection \
> > > +                   python3-pyserial python3-psutil \
> > > +                   python3-pyaudio python3-fann2 \
> > > +                   python3-pocketsphinx \
> > > +                 "
> > > +
> > > +# Mycroft uses Alsa and PulseAudio
> > > +RDEPENDS_${PN} +=3D "alsa-oss alsa-utils alsa-plugins alsa-tools"
> > > +RDEPENDS_${PN} +=3D "pulseaudio pulseaudio-misc pulseaudio-server"
> > > +
> > > +# Mycroft can do this itself on the target, but it's quicker to do i=
t here
> > > +RDEPENDS_${PN} +=3D "mimic"
> > > +
> > > +SYSTEMD_SERVICE_${PN} =3D "mycroft.service"
> > > --
> > > 2.21.0
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

