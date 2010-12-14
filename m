Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PSbO3-0002kZ-Kn
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 21:22:16 +0100
Received: by yxd5 with SMTP id 5so632594yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=CTpshKEc74e8wkRovcF+IkY1cXfDJ8bQseYauc5Ibi0=;
	b=O9k/oCMUIMvbDQOwJprotThDzpFrivGLAhUc4lmtxOCA+aQjfU1MtPF68sQqCW/QAr
	f9Rjbo2psy8IkFR/JOLwUNLbzAlCV4Bh6tncFQyyZ24MtssQuDKMkXfIWvbPziaeTCol
	anclttfBNfF5AtW0vJwzMbeHHBqFqMmxVkYGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=uyo33sl7LzcuTqR1DRQotCa+RCw5g8v2e3qBH6/cUB5HK+6AnlZIkDOKWFAbFrLCsR
	dpuXcjZK84nxxbEvOBVZNWC5pCDsGobuOenmWAKywZLEx72MFPdzUv3v27lzUUO6VwO4
	JPCM8b58dWyPCS4Xg95SocVv/Tyr4zVYa4frM=
Received: by 10.90.10.31 with SMTP id 31mr7298328agj.85.1292358037702; Tue, 14
	Dec 2010 12:20:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 14 Dec 2010 12:20:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Dec 2010 12:20:17 -0800
Message-ID: <AANLkTikeZUPL0hPHrEVgm5xQyPCVg+4xz6WcH+T=WV=x@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] This patch applied to ltp runalltests.sh script to make default set of test suits configurable which is not the default behaviour. By default rullalltests.sh invokes runltp wihout specifying any set of tests to run. This patch will g
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
X-List-Received-Date: Tue, 14 Dec 2010 20:22:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2010 at 12:00 AM, irfan sadiq <irfan_sadiq@mentor.com> wrot=
e:
> From: hmsadiq <irfan_sadiq@mentor.com>
>
> Signed-off-by: hmsadiq <irfan_sadiq@mentor.com>

thank you for the patch. Couple of things

1. You should bump up the PR
2. The summary field should be concise and more details should be put
in after the summary follow this
http://wiki.openembedded.org/index.php/Commit_Policy

Thanks
-Khem

> ---
> =C2=A0recipes/ltp/ltp-20100831/runalltests.patch | =C2=A0302 ++++++++++++=
++++++++++++++++
> =C2=A0recipes/ltp/ltp_20100831.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 304 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/ltp/ltp-20100831/runalltests.patch b/recipes/ltp/ltp=
-20100831/runalltests.patch
> new file mode 100644
> index 0000000..c567769
> --- /dev/null
> +++ b/recipes/ltp/ltp-20100831/runalltests.patch
> @@ -0,0 +1,302 @@
> +--- ltp-full-20100831.orig/runalltests.sh =C2=A0 =C2=A0 =C2=A02010-09-14=
 16:04:32.000000000 +0500
> ++++ ltp-full-20100831/runalltests.sh =C2=A0 2010-12-13 11:18:11.85738210=
7 +0500
> +@@ -68,6 +68,12 @@ export RUN_FILECAPS=3D0
> + export LIBCAPS_INSTALLED=3D0
> + export LIBATTR_INSTALLED=3D0
> +
> ++## Set this to 1 if tmp_tools tests are required to be tested
> ++export RUN_TPM_TOOLS=3D0
> ++
> ++## Set this to 1 if tcore tests are required to be tested
> ++export RUN_TCORE=3D0
> ++
> + ## Set this to 1 if you wish to execute the stress_cd tests
> + ## Make sure you have FLOPPY inserted, be warned that you
> + ## will loose all data on it after the tests,
> +@@ -202,6 +208,194 @@ export RUN_SMACK_SECURITY_TESTS=3D0
> + ##Set this to 1 if you wish to run the Basic PERFORMANCE COUNTER tests
> + export RUN_PERFORMANCE_COUNTERS_TESTS=3D0
> +
> ++### Additional tests That are not included in runalltests.sh
> ++export RUN_LTP_AIODIO_PART1=3D0
> ++export RUN_LTP_AIODIO_PART2=3D0
> ++export RUN_LTP_AIODIO_PART3=3D0
> ++export RUN_LTP_AIODIO_PART4=3D0
> ++
> ++if [ $RUN_LTP_AIODIO_PART1 -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AIODIO_PART1_STR=3D"ltp-aiodio.part1"
> ++fi
> ++
> ++if [ $RUN_LTP_AIODIO_PART2 -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AIODIO_PART2_STR=3D"ltp-aiodio.part2"
> ++fi
> ++
> ++if [ $RUN_LTP_AIODIO_PART3 -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AIODIO_PART3_STR=3D"ltp-aiodio.part3"
> ++fi
> ++
> ++if [ $RUN_LTP_AIODIO_PART4 -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0AIODIO_PART4_STR=3D"ltp-aiodio.part4"
> ++fi
> ++
> ++## This is default set of tests chose which tests you want to perform b=
y default
> ++## Set this to 1 if you wish to run the specific tests
> ++
> ++export RUN_DEFAULT_MATH=3D0
> ++export RUN_DEFAULT_NPTL=3D0
> ++export RUN_DEFAULT_PTY=3D0
> ++export RUN_DEFAULT_IO=3D0
> ++export RUN_DEFAULT_TIMERS=3D0
> ++export RUN_DEFAULT_MM=3D0
> ++export RUN_DEFAULT_IPC=3D0
> ++export RUN_DEFAULT_SCHED=3D0
> ++export RUN_DEFAULT_CONTAINERS=3D0
> ++export RUN_DEFAULT_CONNECTORS=3D0
> ++export RUN_DEFAULT_FILECAPS=3D0
> ++export RUN_DEFAULT_CAP_BOUNDS=3D0
> ++export RUN_DEFAULT_FSX=3D0
> ++export RUN_DEFAULT_FCNTL_LOCKTESTS=3D0
> ++export RUN_DEFAULT_CONTROLLERS=3D0
> ++export RUN_DEFAULT_ADMIN_TOOLS=3D0
> ++export RUN_DEFAULT_HYPERTHREADING=3D0
> ++export RUN_DEFAULT_DIO=3D0
> ++export RUN_DEFAULT_SYSCALLS=3D0
> ++export RUN_DEFAULT_FS_PERMS_SIMPLE=3D0
> ++export RUN_DEFAULT_POWER_MANAGEMENT_TESTS=3D0
> ++export RUN_DEFAULT_NUMA=3D0
> ++export RUN_DEFAULT_HUGETLB=3D0
> ++export RUN_DEFAULT_COMMANDS=3D0
> ++export RUN_DEFAULT_FS=3D0
> ++export RUN_DEFAULT_FS_BIND=3D0
> ++
> ++if [ $RUN_DEFAULT_SYSCALLS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSCALLS_STR=3D"syscalls"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FS_STR=3D"fs"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FS_PERMS_SIMPLE -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FS_PERMS_SIMPLE_STR=3D"fs_perms_simple"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FSX -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FSX_STR=3D"fsx"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_DIO -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0DIO_STR=3D"dio"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_IO -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0IO_STR=3D"io"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_MM -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0MM_STR=3D"mm"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_IPC -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0IPC_STR=3D"ipc"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_SCHED -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0SCHED_STR=3D"sched"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_MATH -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0MATH_STR=3D"math"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_NPTL -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0NPTL_STR=3D"nptl"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_PTY -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0PTY_STR=3D"pty"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_CONTAINERS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTAINERS_STR=3D"containers"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FS_BIND -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FS_BIND_STR=3D"fs_bind"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_CONTROLLERS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CONTROLLERS_STR=3D"controllers"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FILECAPS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FILECAPS_STR=3D"filecaps"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_CAP_BOUNDS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CAP_BOUNDS_STR=3D"cap_bounds"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_FCNTL_LOCKTESTS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0FCNTL_LOCKTESTS_STR=3D"fcntl-locktests"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_CONNECTORS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0CONNECTORS_STR=3D"connectors"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_ADMIN_TOOLS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0ADMIN_TOOLS_STR=3D"admin_tools"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_TIMERS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMERS_STR=3D"timers"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_POWER_MANAGEMENT_TESTS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0POWER_MANAGEMENT_TESTS_STR=3D"power_managem=
ent_tests"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_NUMA -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0NUMA_STR=3D"numa"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_HUGETLB -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0HUGETLB_STR=3D"hugetlb"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_COMMANDS -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0COMMANDS_STR=3D"commands"
> ++fi
> ++
> ++if [ $RUN_DEFAULT_HYPERTHREADING -eq 1 ]
> ++then
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0HYPERTHREADING_STR=3D"hyperthreading"
> ++fi
> ++
> ++
> ++
> + export LTP_VERSION=3D`"${RUNLTP}" -e`
> + export TEST_START_TIME=3D`date +"%Y_%b_%d-%Hh_%Mm_%Ss"`
> + export HARDWARE_TYPE=3D$(uname -i)
> +@@ -215,13 +409,68 @@ if ! cd "${LTPROOT}"; then
> + =C2=A0 =C2=A0 =C2=A0 exit $rc
> + fi
> +
> ++# ## The First one i plan to run is the default LTP run ##
> ++# ## START =3D> Test Series 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> ++# echo "Running Default LTP..."
> ++# "${RUNLTP}" -g $HTML_OUTPUT_FILE_NAME
> ++# printf "Completed running Default LTP\n\n\n"
> ++# ## END =3D> Test Series 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> ++
> + ## The First one i plan to run is the default LTP run ##
> + ## START =3D> Test Series 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> + echo "Running Default LTP..."
> +-"${RUNLTP}" -g $HTML_OUTPUT_FILE_NAME
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0RUN_DEFAULT_SET=3D"$SYSCALLS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FS_PERMS_SIMPLE_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FSX_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$DIO_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$IO_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$MM_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$IPC_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$SCHED_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$MATH_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$NPTL_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$PTY_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$CONTAINERS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FS_BIND_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$CONTROLLERS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FILECAPS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$CAP_BOUNDS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$FCNTL_LOCKTESTS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$CONNECTORS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$ADMIN_TOOLS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$TIMERS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$POWER_MANAGEMENT_TESTS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$NUMA_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$HUGETLB_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$COMMANDS_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$HYPERTHREADING_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$AIODIO_PART1_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$AIODIO_PART2_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$AIODIO_PART3_STR \
> ++ =C2=A0 =C2=A0 =C2=A0$AIODIO_PART4_STR"
> ++
> ++ =C2=A0 =C2=A0 =C2=A0rm -f runtest/defaultset
> ++ =C2=A0 =C2=A0 =C2=A0for TEST in $RUN_DEFAULT_SET
> ++ =C2=A0 =C2=A0 =C2=A0do
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UPPER=3D`echo $TEST | tr "[:lower:]"=
 "[:upper:]"`
> ++# # =C2=A0 =C2=A0 =C2=A0 var=3D"_STR"
> ++# # =C2=A0 =C2=A0 =C2=A0 echo " =C2=A0 =C2=A0 =C2=A0\$$UPPER$var \\"
> ++# # =C2=A0 =C2=A0 =C2=A0 echo "Running Test $UPPER"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "Running Test $TEST"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat =C2=A0runtest/$TEST >> runtest/d=
efaultset
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 "if [ \$RUN_DEFAULT_$UPPER -eq 1 ]"
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 "then"
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 " =C2=A0$UPPER$var=3D\"$TEST\""
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 "fi"
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 ""
> ++# # =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo=
 "export RUN_DEFAULT_$UPPER=3D1"
> ++ =C2=A0 =C2=A0 =C2=A0done
> ++ =C2=A0 =C2=A0 =C2=A0"${RUNLTP}" -f defaultset -g defaultset.html
> + printf "Completed running Default LTP\n\n\n"
> + ## END =3D> Test Series 1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> +
> ++
> + ## The next one i plan to run is ballista =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ##
> + ## START =3D> Test Series 2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> + if [ $RUN_BALLISTA -eq 1 ]
> +@@ -353,15 +602,20 @@ then
> + fi
> + ## END =3D> Test Series 6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> +
> +-
> + ## The next one i plan to run is tpm_tools =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0##
> + ## START =3D> Test Series 7 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> ++if [ $RUN_TPM_TOOLS -eq 1 ]
> ++then
> + "${RUNLTP}" -f tpm_tools
> ++fi
> + ## END =3D> Test Series 7 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> +
> + ## The next one i plan to run is tcore_patch_test_suites
> + ## START =3D> Test Series 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> ++if [ $RUN_TCORE -eq 1 ]
> ++then
> + "${RUNLTP}" -f tcore
> ++fi
> + ## END =3D> Test Series 8 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ##
> +
> +
> diff --git a/recipes/ltp/ltp_20100831.bb b/recipes/ltp/ltp_20100831.bb
> index 6c5a0ae..c57b5e2 100644
> --- a/recipes/ltp/ltp_20100831.bb
> +++ b/recipes/ltp/ltp_20100831.bb
> @@ -7,7 +7,8 @@ PR =3D "r0"
>
> =C2=A0inherit autotools
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.tgz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.tgz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://runalltests.patch;patch=3D1 "
>
> =C2=A0S =3D "${WORKDIR}/ltp-full-${PV}"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


