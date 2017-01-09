Return-Path: <vincent.libre@cryostase.eu>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDA371A62
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 22:35:50 +0000 (UTC)
Received: from [22.64.25.32] (unknown [208.54.80.158])
	(Authenticated sender: vincent.rubiolo)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 21A8CB00350
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jan 2017 23:35:46 +0100 (CET)
Date: Mon, 09 Jan 2017 23:35:34 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <8a55e15b-21d5-8dfa-5adb-09f84b7809fe@cryostase.eu>
References: <8a55e15b-21d5-8dfa-5adb-09f84b7809fe@cryostase.eu>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
From: Vincent Rubiolo <vincent.libre@cryostase.eu>
Message-ID: <4366BC62-AA8B-412F-92CB-23B8EE1DA412@cryostase.eu>
Subject: Re: [meta-maker] Octoprint on Intel Edison (yocto dizzy): failed python-flask RDEPENDS
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
X-List-Received-Date: Mon, 09 Jan 2017 22:35:51 -0000
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On December 30, 2016 7:14:28 AM CET, Vincent Rubiolo <vincent=2Elibre@cryo=
stase=2Eeu> wrote:
>Hi everyone,
>
>I am trying to include the meta-maker layer to enable octoprint on the=20
>Intel Edison=2E I am using the Yocto project drop that Intel provides[1]=
=20
>and successfully built it (with a reduced set of packages, I am=20
>interested only in the bits necessary to enable Octoprint)=2E
>
>Intel drop appears to be based on the yocto daisy branch (bitbake=20
>reports so during a build + I diffed the meta-openembedded daisy git=20
>tree against the Intel drop)=2E I have thus checked out that branch of=20
>meta-maker and added it under my poky subdirectory + added it to=20
>bblayers=2Econf=2E
>
>The problem I have is that the build fails because of a missing
>RDEPENDS:
>+++
>$ bitbake octoprint -c fetchall
>WARNING: Host distribution "Fedora-23" has not been validated with this
>
>version of the build system; you may possibly experience unexpected=20
>failures=2E It is recommended that you use a tested distribution=2E
>Loading cache: 100%=20
>|####################################################################|=20
>ETA:  00:00:00
>Loaded 2170 entries from dependency cache=2E
>NOTE: Resolving any missing task queue dependencies
>NOTE: multiple providers are available for python-distribute-native=20
>(python-distribute-native, python-setuptools-native)
>NOTE: consider defining a PREFERRED_PROVIDER entry to match=20
>python-distribute-native
>ERROR: Nothing RPROVIDES 'python-flask' (but=20
>/yocto/iot-devkit-yp-poky-edison-20160606/build_edison/=2E=2E/poky/meta-o=
penembedded/meta-maker/recipes-webui/octoprint/octoprint_git=2Ebb
>
>RDEPENDS on or otherwise requires it)
>NOTE: Runtime target 'python-flask' is unbuildable, removing=2E=2E=2E
>Missing or unbuildable dependency chain was: ['python-flask']
>ERROR: Required build target 'octoprint' has no buildable providers=2E
>Missing or unbuildable dependency chain was: ['octoprint',
>'python-flask']
>
>Summary: There was 1 WARNING message shown=2E
>Summary: There were 2 ERROR messages shown, returning a non-zero exit
>code=2E
>+++
>
>In the meta-maker and meta-openembedded trees dizzy branches, I see no=20
>python-flask recipe/package=2E It looks to me the patch for octoprint=20
>1=2E2=2E10 has been merged into the meta-maker dizzy branch with the=20
>RDEPENDS list still matching that of the newest meta-openembedded (but
>I=20
>might be wrong)=2E
>
>Is my analysis correct? If so, is there a way to know which RDEPEND I=20
>should use for octoprint in the dizzy branch to match the=20
>meta-openembedded one?
>
>Another possibility could be to use the meta-intel-edison from the
>yocto=20
>project git repo[2] with meta-openembedded & meta-maker on master but I
>
>have yet to try that=2E
>
>Thanks a lot for your help!
>
>Vincent
>
>[1]=20
>http://iotdk=2Eintel=2Ecom/src/3=2E5/edison/iot-devkit-yp-poky-edison-201=
60606=2Ezip
>[2] http://git=2Eyoctoproject=2Eorg/cgit/cgit=2Ecgi/meta-intel-edison/
>
>To reproduce:
>get=20
>http://iotdk=2Eintel=2Ecom/src/3=2E5/edison/iot-devkit-yp-poky-edison-201=
60606=2Ezip
>
>and unzip
>cd iot-devkit-yp-poky-edison-20160606/poky/meta-openembedded
>git clone git://git=2Eyoctoproject=2Eorg/meta-maker -b dizzy
>add meta-maker layer to=20
>iot-devkit-yp-poky-edison-20160606/build_edison/conf/bblayers=2Econf
>cd iot-devkit-yp-poky-edison-20160606/poky/
>source oe-init-build-env =2E=2E/build_edison/
>bitbake octoprint -c fetchall

Hello,

Would somebody have some advice here?

Thanks much,

Vincent

