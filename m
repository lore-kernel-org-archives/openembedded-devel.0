Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f51.google.com (unknown [209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 88C636028A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 18:20:10 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id gf5so804972lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 11:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=En3MQadaHTnJoKa1AABAGuBaUrihVsqTYR8ND1LhOMQ=;
	b=EJgXxeMMGtM3Ydo5KTjsEm9NKx7OIS3oZ0CUMQ2vNxabzQU5Y6E5AhXpVv5cSJ44qe
	lfilVuPFYS8U/0Rwrt9grUxcGFHjnolujY33c8EiD094BMEGZ4xFRmy4Uq9shvfGFcIz
	JhWyXL8KUS26upCm4mFO51A9rc7Kb/OeGn4hbOP7ebsK5kaEgSniMZXcFW1LfBY68H4c
	QOqD1vPEkAJANjAKwdqPy2QObE6KMbkl0sr9KMEKKs3v3GTThvE1VpMFf1xDH/d88Ify
	CQ71Z4oc864ypN4407goe03lqJMGXSybSP/jDJ37jTbiKjC6SBSQI3Gz26rHHCM6mYs0
	bhOQ==
X-Gm-Message-State: ALoCoQkfHDTOdD7j/bXOVA2jrtUq880RTbFdi1H8O4HLd0mmxbaMg51YkgCPswMQkeENMWDK52VT
X-Received: by 10.152.143.3 with SMTP id sa3mr2231824lab.53.1399746010471;
	Sat, 10 May 2014 11:20:10 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id u4sm5201649lal.8.2014.05.10.11.20.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 10 May 2014 11:20:09 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 May 2014 21:20:02 +0300
Message-Id: <1399746002-22669-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] acpitests: update to 20140424 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 May 2014 18:20:12 -0000

Sync up/refresh aapits build fixes, 0001-Fixup-aapits-build.patch is
splitted and replaced by aapits-linux.patch / aapits-makefile.patch

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../acpica/acpitests/0001-Fixup-aapits-build.patch | 558 ---------------------
 .../acpica/acpitests/aapits-linux.patch            | 336 +++++++++++++
 .../acpica/acpitests/aapits-makefile.patch         |  26 +
 ...acpitests_20140114.bb => acpitests_20140424.bb} |  11 +-
 4 files changed, 368 insertions(+), 563 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/acpica/acpitests/0001-Fixup-aapits-build.patch
 create mode 100644 meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
 create mode 100644 meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
 rename meta-oe/recipes-extended/acpica/{acpitests_20140114.bb => acpitests_20140424.bb} (67%)

diff --git a/meta-oe/recipes-extended/acpica/acpitests/0001-Fixup-aapits-build.patch b/meta-oe/recipes-extended/acpica/acpitests/0001-Fixup-aapits-build.patch
deleted file mode 100644
index 6565a32..0000000
--- a/meta-oe/recipes-extended/acpica/acpitests/0001-Fixup-aapits-build.patch
+++ /dev/null
@@ -1,558 +0,0 @@
-From d9743540b5399a14a7ca1ba708156bed956d9425 Mon Sep 17 00:00:00 2001
-From: Al Stone <ahs3@ahs3.net>
-Date: Fri, 17 Jan 2014 12:51:13 +0100
-Subject: [PATCH] Fixup aapits build
-
-From http://git.linaro.org/people/al.stone/acpica-tools.git
-Upstream-status: Unknown
----
- tests/aapits/Makefile      | 44 +++++++++++++++++++++++++++++++++++++++++---
- tests/aapits/atexec.c      | 15 ++++++++++-----
- tests/aapits/atinit.c      | 10 +++++-----
- tests/aapits/atmain.c      |  6 +++---
- tests/aapits/atnamespace.c | 12 ++++++++----
- tests/aapits/atosxfctrl.c  | 21 +++++++++++++++++----
- tests/aapits/atresource.c  | 10 +++++-----
- tests/aapits/osunixxf.c    | 25 ++++++++++++++++++++++---
- 8 files changed, 111 insertions(+), 32 deletions(-)
-
-diff --git a/tests/aapits/Makefile b/tests/aapits/Makefile
-index b774c9c..9bf12b8 100644
---- a/tests/aapits/Makefile
-+++ b/tests/aapits/Makefile
-@@ -20,37 +20,53 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/hardware/hwxface.c \
- 	../../source/common/getopt.c \
- 	../../source/components/debugger/dbcmds.c \
-+	../../source/components/debugger/dbconvert.c \
- 	../../source/components/debugger/dbdisply.c \
- 	../../source/components/debugger/dbexec.c \
- 	../../source/components/debugger/dbfileio.c \
- 	../../source/components/debugger/dbhistry.c \
- 	../../source/components/debugger/dbinput.c \
-+	../../source/components/debugger/dbmethod.c \
-+	../../source/components/debugger/dbnames.c \
- 	../../source/components/debugger/dbstats.c \
-+	../../source/components/debugger/dbtest.c \
- 	../../source/components/debugger/dbutils.c \
- 	../../source/components/debugger/dbxface.c \
- 	../../source/components/disassembler/dmbuffer.c \
-+	../../source/components/disassembler/dmdeferred.c \
- 	../../source/components/disassembler/dmnames.c \
- 	../../source/components/disassembler/dmobject.c \
- 	../../source/components/disassembler/dmopcode.c \
- 	../../source/components/disassembler/dmresrc.c \
- 	../../source/components/disassembler/dmresrcl.c \
-+	../../source/components/disassembler/dmresrcl2.c \
- 	../../source/components/disassembler/dmresrcs.c \
- 	../../source/components/disassembler/dmutils.c \
- 	../../source/components/disassembler/dmwalk.c \
- 	../../source/components/events/evevent.c \
-+	../../source/components/events/evglock.c \
- 	../../source/components/events/evgpeblk.c \
- 	../../source/components/events/evgpe.c \
-+	../../source/components/events/evgpeinit.c \
-+	../../source/components/events/evgpeutil.c \
-+	../../source/components/events/evhandler.c \
- 	../../source/components/events/evmisc.c \
- 	../../source/components/events/evregion.c \
- 	../../source/components/events/evrgnini.c \
- 	../../source/components/events/evsci.c \
- 	../../source/components/events/evxface.c \
- 	../../source/components/events/evxfevnt.c \
-+	../../source/components/events/evxfgpe.c \
- 	../../source/components/events/evxfregn.c \
- 	../../source/components/hardware/hwacpi.c \
-+	../../source/components/hardware/hwesleep.c \
- 	../../source/components/hardware/hwgpe.c \
-+	../../source/components/hardware/hwpci.c \
- 	../../source/components/hardware/hwregs.c \
- 	../../source/components/hardware/hwsleep.c \
-+	../../source/components/hardware/hwxfsleep.c \
-+	../../source/components/dispatcher/dsargs.c \
-+	../../source/components/dispatcher/dscontrol.c \
- 	../../source/components/dispatcher/dsfield.c \
- 	../../source/components/dispatcher/dsinit.c \
- 	../../source/components/dispatcher/dsmethod.c \
-@@ -60,11 +76,13 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/dispatcher/dsutils.c \
- 	../../source/components/dispatcher/dswexec.c \
- 	../../source/components/dispatcher/dswload.c \
-+	../../source/components/dispatcher/dswload2.c \
- 	../../source/components/dispatcher/dswscope.c \
- 	../../source/components/dispatcher/dswstate.c \
- 	../../source/components/executer/exconfig.c \
- 	../../source/components/executer/exconvrt.c \
- 	../../source/components/executer/excreate.c \
-+	../../source/components/executer/exdebug.c \
- 	../../source/components/executer/exdump.c \
- 	../../source/components/executer/exfield.c \
- 	../../source/components/executer/exfldio.c \
-@@ -87,7 +105,9 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/executer/exutils.c \
- 	../../source/components/parser/psargs.c \
- 	../../source/components/parser/psloop.c \
-+	../../source/components/parser/psobject.c \
- 	../../source/components/parser/psopcode.c \
-+	../../source/components/parser/psopinfo.c \
- 	../../source/components/parser/psparse.c \
- 	../../source/components/parser/psscope.c \
- 	../../source/components/parser/pstree.c \
-@@ -96,6 +116,8 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/parser/psxface.c \
- 	../../source/components/namespace/nsaccess.c \
- 	../../source/components/namespace/nsalloc.c \
-+	../../source/components/namespace/nsarguments.c \
-+	../../source/components/namespace/nsconvert.c \
- 	../../source/components/namespace/nsdump.c \
- 	../../source/components/namespace/nsdumpdv.c \
- 	../../source/components/namespace/nseval.c \
-@@ -105,6 +127,7 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/namespace/nsobject.c \
- 	../../source/components/namespace/nsparse.c \
- 	../../source/components/namespace/nspredef.c \
-+	../../source/components/namespace/nsprepkg.c \
- 	../../source/components/namespace/nsrepair.c \
- 	../../source/components/namespace/nsrepair2.c \
- 	../../source/components/namespace/nssearch.c \
-@@ -117,26 +140,35 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/resources/rscalc.c \
- 	../../source/components/resources/rscreate.c \
- 	../../source/components/resources/rsdump.c \
-+	../../source/components/resources/rsdumpinfo.c \
-+	../../source/components/resources/rsinfo.c \
- 	../../source/components/resources/rsio.c \
- 	../../source/components/resources/rsirq.c \
- 	../../source/components/resources/rslist.c \
- 	../../source/components/resources/rsmemory.c \
- 	../../source/components/resources/rsmisc.c \
-+	../../source/components/resources/rsserial.c \
- 	../../source/components/resources/rsutils.c \
- 	../../source/components/resources/rsxface.c \
--	../../source/components/resources/rsinfo.c \
- 	../../source/components/tables/tbfadt.c \
- 	../../source/components/tables/tbfind.c \
- 	../../source/components/tables/tbinstal.c \
-+	../../source/components/tables/tbprint.c \
- 	../../source/components/tables/tbutils.c \
- 	../../source/components/tables/tbxface.c \
-+	../../source/components/tables/tbxfload.c \
- 	../../source/components/tables/tbxfroot.c \
-+	../../source/components/utilities/utaddress.c \
- 	../../source/components/utilities/utalloc.c \
-+	../../source/components/utilities/utbuffer.c \
- 	../../source/components/utilities/utcache.c \
- 	../../source/components/utilities/utcopy.c \
- 	../../source/components/utilities/utdebug.c \
-+	../../source/components/utilities/utdecode.c \
- 	../../source/components/utilities/utdelete.c \
-+	../../source/components/utilities/uterror.c \
- 	../../source/components/utilities/uteval.c \
-+	../../source/components/utilities/utexcep.c \
- 	../../source/components/utilities/utglobal.c \
- 	../../source/components/utilities/utids.c \
- 	../../source/components/utilities/utinit.c \
-@@ -145,17 +177,23 @@ SRCS=	atexec.c atmain.c \
- 	../../source/components/utilities/utmisc.c \
- 	../../source/components/utilities/utmutex.c \
- 	../../source/components/utilities/utobject.c \
-+	../../source/components/utilities/utosi.c \
-+	../../source/components/utilities/utownerid.c \
-+	../../source/components/utilities/utpredef.c \
- 	../../source/components/utilities/utresrc.c \
- 	../../source/components/utilities/utstate.c \
-+	../../source/components/utilities/utstring.c \
- 	../../source/components/utilities/uttrack.c \
--	../../source/components/utilities/utxface.c
-+	../../source/components/utilities/utxface.c \
-+	../../source/components/utilities/utxferror.c \
-+	../../source/components/utilities/utxfinit.c
- #	../../source/components/osunixxf.c
- 
- 
- CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include 
- 
- 
--acpiexec : $(patsubst %.c,%.o, $(SRCS))
-+$(PROG) : $(patsubst %.c,%.o, $(SRCS))
- 	$(CC) $(LDFLAGS) $(patsubst %.c,%.o, $(SRCS)) -o $(PROG)
- 
- CLEANFILES= $(PROG)
-diff --git a/tests/aapits/atexec.c b/tests/aapits/atexec.c
-index 0280557..1406c0f 100644
---- a/tests/aapits/atexec.c
-+++ b/tests/aapits/atexec.c
-@@ -639,6 +639,7 @@ AtBuildLocalFADT2 (
- }
- 
- 
-+#if ACPI_MACHINE_WIDTH == 32
- /*******************************************************************************
-  *
-  * FUNCTION:    AtBuildLocalRSDT
-@@ -757,6 +758,7 @@ AtBuildLocalRSDT (
-         LocalRSDT->Header.Checksum = (UINT8)~LocalRSDT->Header.Checksum;
-     }
- }
-+#endif
- 
- 
- /*******************************************************************************
-@@ -1424,7 +1426,7 @@ AeRegionHandler (
-         ACPI_WARNING ((AE_INFO,
-             "Request on [%4.4s] is beyond region limit Req-%X+%X, Base=%X, Len-%X\n",
-             (RegionObject->Region.Node)->Name.Ascii, (UINT32) Address,
--            ByteWidth, (UINT32) BufferAddress, Length));
-+            ByteWidth, (UINT32) BufferAddress, (UINT32) Length));
- 
-         return (AE_AML_REGION_LIMIT);
-     }
-@@ -1792,7 +1794,9 @@ AtCheckInteger(
-             Path, Obj.Integer.Value, Value);
- #else
-         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
--            Path, Obj.Integer.Value, Value);
-+            Path,
-+	    (long long unsigned int) Obj.Integer.Value,
-+	    (long long unsigned int) Value);
- #endif
-         Status = AE_ERROR;
-     }
-@@ -1871,7 +1875,7 @@ AtCheckString(
-     {
-         TestErrors++;
-         printf ("Test Error: cannot allocate buffer of %d bytes\n",
--            Results.Length);
-+                (int) Results.Length);
-         return (AE_NO_MEMORY);
-     }
-     Results.Pointer = Object;
-@@ -1952,7 +1956,8 @@ AtCheckBuffer(
-     {
-         printf ("AtCheckBuffer: unexpected length %d of Buffer vs"
-             " calculated %d bytes\n",
--            Results.Length, ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length));
-+            (int)Results.Length,
-+	    (int)(ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length)));
-     }
- 
-     /* Initialize the return buffer structure */
-@@ -1961,7 +1966,7 @@ AtCheckBuffer(
-     {
-         TestErrors++;
-         printf ("Test Error: cannot allocate buffer of %d bytes\n",
--            Results.Length);
-+            (int) Results.Length);
-         return (AE_NO_MEMORY);
-     }
-     Results.Pointer = Object;
-diff --git a/tests/aapits/atinit.c b/tests/aapits/atinit.c
-index 5bb8ee3..2444225 100644
---- a/tests/aapits/atinit.c
-+++ b/tests/aapits/atinit.c
-@@ -3024,7 +3024,7 @@ AtInitTest0041(void)
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
- 
-@@ -3046,7 +3046,7 @@ AtInitTest0041(void)
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
- 
-@@ -3066,7 +3066,7 @@ AtInitTest0041(void)
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
-         else if (OutBuffer.Pointer != &Info)
-@@ -3149,7 +3149,7 @@ AtInitTest0042(void)
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (Info));
-+                (int) OutBuffer.Length, (int) sizeof (Info));
-             return (AE_ERROR);
-         }
-         else if (OutBuffer.Pointer != &Info)
-@@ -3214,7 +3214,7 @@ AtInitTest0043(void)
-             AapiErrors++;
-             printf ("API Error: AcpiGetSystemInfo() returned"
-                 " Length %d, expected %d\n",
--                OutBuffer.Length, sizeof (ACPI_SYSTEM_INFO));
-+                (int) OutBuffer.Length, (int) sizeof (ACPI_SYSTEM_INFO));
-             return (AE_ERROR);
-         }
-         else
-diff --git a/tests/aapits/atmain.c b/tests/aapits/atmain.c
-index c3f5de7..e83e524 100644
---- a/tests/aapits/atmain.c
-+++ b/tests/aapits/atmain.c
-@@ -315,7 +315,7 @@ ExecuteTest (
-     {
-         printf ("ACPICA API TS err: test num %ld of test case %ld"
-             " is not implemented\n",
--            test_num, test_case);
-+            (long int) test_num, (long int) test_case);
-         return (AtRetNotImpl);
-     }
- 
-@@ -430,7 +430,7 @@ main(
-     if (test_case < 1 || test_case > AT_TEST_CASE_NUM)
-     {
-         printf ("ACPICA API TS err: test case %ld is out of range 1 - %d\n",
--            test_case, AT_TEST_CASE_NUM);
-+            (long int) test_case, (int) AT_TEST_CASE_NUM);
-         return (AtRetBadParam);
-     }
- 
-@@ -438,7 +438,7 @@ main(
-     if (test_num < 0 || test_num > AtTestCase[test_case].TestsNum)
-     {
-         printf ("ACPICA API TS err: test num %ld is out of range 0 - %d\n",
--            test_num, AtTestCase[test_case].TestsNum);
-+            (long int) test_num, AtTestCase[test_case].TestsNum);
-         return (AtRetBadParam);
-     }
- 
-diff --git a/tests/aapits/atnamespace.c b/tests/aapits/atnamespace.c
-index 8a4ec65..76e3edb 100644
---- a/tests/aapits/atnamespace.c
-+++ b/tests/aapits/atnamespace.c
-@@ -2535,7 +2535,8 @@ AtGetObjectInfoTypeCommon(
- #else
-                 printf ("API Error: Address of %s (0x%llX) != (0x%llX)\n",
-                     PathNames[2 * i + 1],
--                    Info->Address, ExpectedInfo[i].Address);
-+                    (long long unsigned int) Info->Address,
-+		    (long long unsigned int) ExpectedInfo[i].Address);
- #endif
- #else
-                 printf ("API Error: Address of %s (0x%X) != (0x%X)\n",
-@@ -2908,7 +2909,8 @@ AtGetNextObjectTypeCommon(
-         TestErrors++;
-         printf ("AtGetNextObjectTypeCommon: different numbers of entities"
-             "in TypesNames (%d) and LevelTypes0000 (%d)\n",
--            TypesCount, sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE));
-+            TypesCount,
-+	    (int) (sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE)));
-         return (AE_ERROR);
-     }
- 
-@@ -4192,7 +4194,9 @@ AtCheckHandlePathMapping(
-             Pathname, Obj.Integer.Value, Value);
- #else
-         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
--            Pathname, Obj.Integer.Value, Value);
-+            Pathname,
-+	    (long long unsigned int) Obj.Integer.Value,
-+	    (long long unsigned int) Value);
- #endif
-         Status = AE_ERROR;
-     }
-@@ -5199,7 +5203,7 @@ AtGetNameExceptionTest(
-             {
-                 AapiErrors++;
-                 printf ("API Error: AcpiOsAllocate(%d) returned NULL\n",
--                    OutName.Length);
-+                    (int) OutName.Length);
-                 return (AE_ERROR);
-             }
-         }
-diff --git a/tests/aapits/atosxfctrl.c b/tests/aapits/atosxfctrl.c
-index 9680c4a..31d6971 100644
---- a/tests/aapits/atosxfctrl.c
-+++ b/tests/aapits/atosxfctrl.c
-@@ -737,13 +737,15 @@ ACPI_OSXF_EMUL_REG
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%I64x\n",
-+            Width, Address);
- #else
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%llx\n",
-+            Width, (long long unsigned int) Address);
- #endif
- #else
-         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%x\n",
--#endif
-             Width, Address);
-+#endif
-         return (NULL);
-     }
- 
-@@ -764,15 +766,19 @@ ACPI_OSXF_EMUL_REG
- #ifdef    _MSC_VER
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%I64x: 0x%x)"
-                     " and (0x%I64x: 0x%x)\n",
-+                    Reg->Address, Reg->Width, Address, Width);
- #else
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%llx: 0x%x)"
-                     " and (0x%llx: 0x%x)\n",
-+                    (long long unsigned int) Reg->Address,
-+		    Reg->Width,
-+		    (long long unsigned int) Address, Width);
- #endif
- #else
-                 printf("OsxfCtrlFingReg: intersection Regs (0x%x: 0x%x)"
-                     " and (0x%x: 0x%x)\n",
--#endif
-                     Reg->Address, Reg->Width, Address, Width);
-+#endif
-                 return (NULL);
-             }
-         }
-@@ -786,13 +792,15 @@ ACPI_OSXF_EMUL_REG
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%I64x: 0x%x)\n",
-+                Reg->Address, Reg->Width);
- #else
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%llx: 0x%x)\n",
-+                (long long unsigned int) Reg->Address, Reg->Width);
- #endif
- #else
-             printf("OsxfCtrlFingReg: no memory for Reg (0x%x: 0x%x)\n",
--#endif
-                 Reg->Address, Reg->Width);
-+#endif
-             return (NULL);
-         }
-         Reg->Type = Type;
-@@ -932,14 +940,19 @@ OsxfCtrlRegService(UINT32 ServiceFlag)
- #if ACPI_MACHINE_WIDTH == 64
- #ifdef    _MSC_VER
-             printf("%.2u (%s Address 0x%I64x: Width %.2u) r/w counts: %u/%u\n",
-+                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-+                Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
- #else
-             printf("%.2u (%s Address 0x%llx: Width %.2u) r/w counts: %u/%u\n",
-+                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-+                (long long unsigned int) Reg->Address,
-+		Reg->Width, Reg->ReadCount, Reg->WriteCount);
- #endif
- #else
-             printf("%.2u (%s Address 0x%.4x: Width %.2u) r/w counts: %u/%u\n",
--#endif
-                 i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
-                 Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
-+#endif
-             Reg = Reg->Next;
-             i++;
-         }
-diff --git a/tests/aapits/atresource.c b/tests/aapits/atresource.c
-index a570b73..72ade8b 100644
---- a/tests/aapits/atresource.c
-+++ b/tests/aapits/atresource.c
-@@ -174,7 +174,7 @@ AtRsrcTest0000(void)
-         AapiErrors++;
-         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -490,7 +490,7 @@ AtRsrcTest0005(void)
-         AapiErrors++;
-         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -689,7 +689,7 @@ AtRsrcTest0007(void)
-         AapiErrors++;
-         printf ("Api Error: Resource->Length (%d) != %d\n",
-             CurrentResource->Length,
--            ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ)));
-+            (int) (ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ))));
-     }
- 
-     if (CurrentResource->Data.Irq.Triggering != 0) /* Level-Triggered */
-@@ -981,7 +981,7 @@ AtRsrcTest0012(void)
-         AapiErrors++;
-         printf ("API Error: AcpiGetPossibleResources(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-+            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
-         return (AE_ERROR);
-     }
- 
-@@ -1923,7 +1923,7 @@ AtRsrcTest0026(void)
-         AapiErrors++;
-         printf ("API Error: AcpiGetIrqRoutingTable(%s) returned Length %d,"
-             " expected %d\n",
--            Pathname, OutBuffer.Length, 0xA48);
-+            Pathname, (int) OutBuffer.Length, 0xA48);
-         return (AE_ERROR);
-     }
- 
-diff --git a/tests/aapits/osunixxf.c b/tests/aapits/osunixxf.c
-index 9f908fb..1fbdb70 100644
---- a/tests/aapits/osunixxf.c
-+++ b/tests/aapits/osunixxf.c
-@@ -384,7 +384,6 @@ AcpiOsActualVprintf (
-     const char              *Fmt,
-     va_list                 Args)
- {
--    INT32                   Count = 0;
-     UINT8                   Flags;
- 
- 
-@@ -397,7 +396,7 @@ AcpiOsActualVprintf (
-         {
-             /* Output file is open, send the output there */
- 
--            Count = vfprintf (AcpiGbl_DebugFile, Fmt, Args);
-+            vfprintf (AcpiGbl_DebugFile, Fmt, Args);
-         }
-         else
-         {
-@@ -409,7 +408,7 @@ AcpiOsActualVprintf (
- 
-     if (Flags & ACPI_DB_CONSOLE_OUTPUT)
-     {
--        Count = vfprintf (AcpiGbl_OutputFile, Fmt, Args);
-+        vfprintf (AcpiGbl_OutputFile, Fmt, Args);
-     }
- 
-     return;
-@@ -1166,3 +1165,23 @@ AcpiOsActualSignal (
- 
-     return (AE_OK);
- }
-+
-+/******************************************************************************
-+ *
-+ * FUNCTION:    AcpiOsWaitEventsComplete
-+ *
-+ * PARAMETERS:  None
-+ *
-+ * RETURN:      None
-+ *
-+ * DESCRIPTION: Wait for all asynchronous events to complete. This
-+ *              implementation does nothing.
-+ *
-+ *****************************************************************************/
-+
-+void
-+AcpiOsWaitEventsComplete (
-+    void)
-+{
-+    return;
-+}
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
new file mode 100644
index 0000000..116761d
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
@@ -0,0 +1,336 @@
+From: Al Stone <ahs3@ahs3.net>
+Date: Mon, 7 Apr 2014 19:09:37 +0000
+Subject: [PATCH 1/2] Fixup aapits build
+
+From http://git.linaro.org/people/al.stone/acpica-tools.git
+Upstream-status: Unknown
+
+diff -urN acpica-unix2-20130626/tests/aapits/atexec.c acpica-unix2-20130626-aapits/tests/aapits/atexec.c
+--- acpica-unix2-20130626/tests/aapits/atexec.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atexec.c	2013-07-25 13:44:23.023894441 -0600
+@@ -639,6 +639,7 @@
+ }
+ 
+ 
++#if ACPI_MACHINE_WIDTH == 32
+ /*******************************************************************************
+  *
+  * FUNCTION:    AtBuildLocalRSDT
+@@ -757,8 +758,9 @@
+         LocalRSDT->Header.Checksum = (UINT8)~LocalRSDT->Header.Checksum;
+     }
+ }
++#endif
+ 
+ 
+ /*******************************************************************************
+  *
+  * FUNCTION:    AtBuildLocalXSDT
+@@ -1424,7 +1426,7 @@
+         ACPI_WARNING ((AE_INFO,
+             "Request on [%4.4s] is beyond region limit Req-%X+%X, Base=%X, Len-%X\n",
+             (RegionObject->Region.Node)->Name.Ascii, (UINT32) Address,
+-            ByteWidth, (UINT32) BufferAddress, Length));
++            ByteWidth, (UINT32) BufferAddress, (UINT32) Length));
+ 
+         return (AE_AML_REGION_LIMIT);
+     }
+@@ -1792,7 +1796,9 @@
+             Path, Obj.Integer.Value, Value);
+ #else
+         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
+-            Path, Obj.Integer.Value, Value);
++            Path,
++	    (long long unsigned int) Obj.Integer.Value,
++	    (long long unsigned int) Value);
+ #endif
+         Status = AE_ERROR;
+     }
+@@ -1871,7 +1877,7 @@
+     {
+         TestErrors++;
+         printf ("Test Error: cannot allocate buffer of %d bytes\n",
+-            Results.Length);
++                (int) Results.Length);
+         return (AE_NO_MEMORY);
+     }
+     Results.Pointer = Object;
+@@ -1952,7 +1956,8 @@
+     {
+         printf ("AtCheckBuffer: unexpected length %d of Buffer vs"
+             " calculated %d bytes\n",
+-            Results.Length, ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length));
++            (int)Results.Length,
++	    (int)(ACPI_ROUND_UP_TO_NATIVE_WORD(sizeof (ACPI_OBJECT) + Length)));
+     }
+ 
+     /* Initialize the return buffer structure */
+@@ -1961,7 +1968,7 @@
+     {
+         TestErrors++;
+         printf ("Test Error: cannot allocate buffer of %d bytes\n",
+-            Results.Length);
++            (int) Results.Length);
+         return (AE_NO_MEMORY);
+     }
+     Results.Pointer = Object;
+diff -urN acpica-unix2-20130626/tests/aapits/atinit.c acpica-unix2-20130626-aapits/tests/aapits/atinit.c
+--- acpica-unix2-20130626/tests/aapits/atinit.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atinit.c	2013-07-25 13:20:19.706705960 -0600
+@@ -3024,7 +3024,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+ 
+@@ -3046,7 +3046,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+ 
+@@ -3066,7 +3066,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+         else if (OutBuffer.Pointer != &Info)
+@@ -3149,7 +3149,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (Info));
++                (int) OutBuffer.Length, (int) sizeof (Info));
+             return (AE_ERROR);
+         }
+         else if (OutBuffer.Pointer != &Info)
+@@ -3214,7 +3214,7 @@
+             AapiErrors++;
+             printf ("API Error: AcpiGetSystemInfo() returned"
+                 " Length %d, expected %d\n",
+-                OutBuffer.Length, sizeof (ACPI_SYSTEM_INFO));
++                (int) OutBuffer.Length, (int) sizeof (ACPI_SYSTEM_INFO));
+             return (AE_ERROR);
+         }
+         else
+diff -urN acpica-unix2-20130626/tests/aapits/atmain.c acpica-unix2-20130626-aapits/tests/aapits/atmain.c
+--- acpica-unix2-20130626/tests/aapits/atmain.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atmain.c	2013-07-25 13:18:22.083323948 -0600
+@@ -315,7 +315,7 @@
+     {
+         printf ("ACPICA API TS err: test num %ld of test case %ld"
+             " is not implemented\n",
+-            test_num, test_case);
++            (long int) test_num, (long int) test_case);
+         return (AtRetNotImpl);
+     }
+ 
+@@ -430,7 +432,7 @@
+     if (test_case < 1 || test_case > AT_TEST_CASE_NUM)
+     {
+         printf ("ACPICA API TS err: test case %ld is out of range 1 - %d\n",
+-            test_case, AT_TEST_CASE_NUM);
++            (long int) test_case, (int) AT_TEST_CASE_NUM);
+         return (AtRetBadParam);
+     }
+ 
+@@ -438,7 +440,7 @@
+     if (test_num < 0 || test_num > AtTestCase[test_case].TestsNum)
+     {
+         printf ("ACPICA API TS err: test num %ld is out of range 0 - %d\n",
+-            test_num, AtTestCase[test_case].TestsNum);
++            (long int) test_num, AtTestCase[test_case].TestsNum);
+         return (AtRetBadParam);
+     }
+
+diff -urN acpica-unix2-20130626/tests/aapits/atnamespace.c acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c
+--- acpica-unix2-20130626/tests/aapits/atnamespace.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atnamespace.c	2013-07-25 13:24:15.366466707 -0600
+@@ -2535,7 +2535,8 @@
+ #else
+                 printf ("API Error: Address of %s (0x%llX) != (0x%llX)\n",
+                     PathNames[2 * i + 1],
+-                    Info->Address, ExpectedInfo[i].Address);
++                    (long long unsigned int) Info->Address,
++		    (long long unsigned int) ExpectedInfo[i].Address);
+ #endif
+ #else
+                 printf ("API Error: Address of %s (0x%X) != (0x%X)\n",
+@@ -2908,7 +2909,8 @@
+         TestErrors++;
+         printf ("AtGetNextObjectTypeCommon: different numbers of entities"
+             "in TypesNames (%d) and LevelTypes0000 (%d)\n",
+-            TypesCount, sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE));
++            TypesCount,
++	    (int) (sizeof (LevelTypes0000) / sizeof (ACPI_OBJECT_TYPE)));
+         return (AE_ERROR);
+     }
+ 
+@@ -4192,7 +4194,9 @@
+             Pathname, Obj.Integer.Value, Value);
+ #else
+         printf ("API Error: Value of %s is 0x%llx instead of expected 0x%llx\n",
+-            Pathname, Obj.Integer.Value, Value);
++            Pathname,
++	    (long long unsigned int) Obj.Integer.Value,
++	    (long long unsigned int) Value);
+ #endif
+         Status = AE_ERROR;
+     }
+@@ -5199,7 +5203,7 @@
+             {
+                 AapiErrors++;
+                 printf ("API Error: AcpiOsAllocate(%d) returned NULL\n",
+-                    OutName.Length);
++                    (int) OutName.Length);
+                 return (AE_ERROR);
+             }
+         }
+diff -urN acpica-unix2-20130626/tests/aapits/atosxfctrl.c acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c
+--- acpica-unix2-20130626/tests/aapits/atosxfctrl.c	2013-01-17 12:48:28.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atosxfctrl.c	2013-07-25 13:30:00.375492751 -0600
+@@ -737,13 +737,15 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%I64x\n",
++            Width, Address);
+ #else
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%llx\n",
++            Width, (long long unsigned int) Address);
+ #endif
+ #else
+         printf("OsxfCtrlFingReg: unexpected Width %d of Reg 0x%x\n",
+-#endif
+             Width, Address);
++#endif
+         return (NULL);
+     }
+ 
+@@ -764,15 +766,19 @@
+ #ifdef    _MSC_VER
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%I64x: 0x%x)"
+                     " and (0x%I64x: 0x%x)\n",
++                    Reg->Address, Reg->Width, Address, Width);
+ #else
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%llx: 0x%x)"
+                     " and (0x%llx: 0x%x)\n",
++                    (long long unsigned int) Reg->Address,
++		    Reg->Width,
++		    (long long unsigned int) Address, Width);
+ #endif
+ #else
+                 printf("OsxfCtrlFingReg: intersection Regs (0x%x: 0x%x)"
+                     " and (0x%x: 0x%x)\n",
+-#endif
+                     Reg->Address, Reg->Width, Address, Width);
++#endif
+                 return (NULL);
+             }
+         }
+@@ -786,13 +792,15 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%I64x: 0x%x)\n",
++                Reg->Address, Reg->Width);
+ #else
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%llx: 0x%x)\n",
++                (long long unsigned int) Reg->Address, Reg->Width);
+ #endif
+ #else
+             printf("OsxfCtrlFingReg: no memory for Reg (0x%x: 0x%x)\n",
+-#endif
+                 Reg->Address, Reg->Width);
++#endif
+             return (NULL);
+         }
+         Reg->Type = Type;
+@@ -932,14 +940,19 @@
+ #if ACPI_MACHINE_WIDTH == 64
+ #ifdef    _MSC_VER
+             printf("%.2u (%s Address 0x%I64x: Width %.2u) r/w counts: %u/%u\n",
++                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
++                Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
+ #else
+             printf("%.2u (%s Address 0x%llx: Width %.2u) r/w counts: %u/%u\n",
++                i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
++                (long long unsigned int) Reg->Address,
++		Reg->Width, Reg->ReadCount, Reg->WriteCount);
+ #endif
+ #else
+             printf("%.2u (%s Address 0x%.4x: Width %.2u) r/w counts: %u/%u\n",
+-#endif
+                 i, (Reg->Type == EMUL_REG_SYS)? "SYS": "IO",
+                 Reg->Address, Reg->Width, Reg->ReadCount, Reg->WriteCount);
++#endif
+             Reg = Reg->Next;
+             i++;
+         }
+diff -urN acpica-unix2-20130626/tests/aapits/atresource.c acpica-unix2-20130626-aapits/tests/aapits/atresource.c
+--- acpica-unix2-20130626/tests/aapits/atresource.c	2013-01-17 12:48:29.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/atresource.c	2013-07-25 13:25:49.423565947 -0600
+@@ -174,7 +174,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -490,7 +490,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetCurrentResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -689,7 +689,7 @@
+         AapiErrors++;
+         printf ("Api Error: Resource->Length (%d) != %d\n",
+             CurrentResource->Length,
+-            ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ)));
++            (int) (ACPI_ROUND_UP_TO_NATIVE_WORD (ACPI_RS_SIZE (ACPI_RESOURCE_IRQ))));
+     }
+ 
+     if (CurrentResource->Data.Irq.Triggering != 0) /* Level-Triggered */
+@@ -981,7 +981,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetPossibleResources(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, RT0000_DEV0_CRS_LEN);
++            Pathname, (int) OutBuffer.Length, RT0000_DEV0_CRS_LEN);
+         return (AE_ERROR);
+     }
+ 
+@@ -1923,7 +1923,7 @@
+         AapiErrors++;
+         printf ("API Error: AcpiGetIrqRoutingTable(%s) returned Length %d,"
+             " expected %d\n",
+-            Pathname, OutBuffer.Length, 0xA48);
++            Pathname, (int) OutBuffer.Length, 0xA48);
+         return (AE_ERROR);
+     }
+
+diff -urN acpica-unix2-20130626/tests/aapits/Makefile acpica-unix2-20130626-aapits/tests/aapits/Makefile
+--- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 12:48:29.000000000 -0700
++++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	2013-07-25 15:17:09.309236422 -0600
+@@ -194,7 +194,7 @@
+ CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include 
+ 
+ 
+-acpiexec : $(patsubst %.c,%.o, $(SRCS))
++$(PROG) : $(patsubst %.c,%.o, $(SRCS))
+ 	$(CC) $(LDFLAGS) $(patsubst %.c,%.o, $(SRCS)) -o $(PROG)
+ 
+ CLEANFILES= $(PROG)
diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
new file mode 100644
index 0000000..d38501b
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
@@ -0,0 +1,26 @@
+From: Al Stone <ahs3@ahs3.net>
+Date: Mon, 7 Apr 2014 19:09:37 +0000
+Subject: [PATCH 1/2] Fixup aapits build
+
+From http://git.linaro.org/people/al.stone/acpica-tools.git
+Upstream-status: Unknown
+
+diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140325/tests/aapits/Makefile
+--- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.683636794 -0600
++++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	2014-04-05 15:10:57.879184598 -0600
+@@ -20,6 +20,7 @@
+ 	../../source/components/hardware/hwxface.c \
+ 	../../source/common/cmfsize.c \
+ 	../../source/common/getopt.c \
++	../../source/common/ahids.c \
+ 	../../source/components/debugger/dbcmds.c \
+ 	../../source/components/debugger/dbconvert.c \
+ 	../../source/components/debugger/dbdisply.c \
+@@ -154,6 +155,7 @@
+ 	../../source/components/tables/tbfadt.c \
+ 	../../source/components/tables/tbfind.c \
+ 	../../source/components/tables/tbinstal.c \
++	../../source/components/tables/tbdata.c \
+ 	../../source/components/tables/tbprint.c \
+ 	../../source/components/tables/tbutils.c \
+ 	../../source/components/tables/tbxface.c \
diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb b/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
similarity index 67%
rename from meta-oe/recipes-extended/acpica/acpitests_20140114.bb
rename to meta-oe/recipes-extended/acpica/acpitests_20140424.bb
index d8a3b9f..7e145bb 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
@@ -8,12 +8,13 @@ DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
            https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
-           file://0001-Fixup-aapits-build.patch \
+           file://aapits-linux.patch \
+           file://aapits-makefile.patch \
     "
-SRC_URI[acpitests.md5sum] = "c72b61e092d2b25726dfff6e455116c9"
-SRC_URI[acpitests.sha256sum] = "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"
-SRC_URI[acpica.md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
-SRC_URI[acpica.sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
+SRC_URI[acpitests.md5sum] = "bfc399cecb21e9491d362d8e480b2689"
+SRC_URI[acpitests.sha256sum] = "e7d7ff638872543909b38c2498e88958251ee6ce4d22bc13d4e3925771212c0e"
+SRC_URI[acpica.md5sum] = "733532f005fba5d1c5344440651b13d1"
+SRC_URI[acpica.sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf751bbc"
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-- 
1.9.3


