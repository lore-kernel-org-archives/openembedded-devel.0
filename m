Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B7FC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 22:50:56 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.7770.1717455047637450646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 15:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=b8hI5nHR;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b992fd796so453106e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455046; x=1718059846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcVqu1Pw5jcbV1Kn0vjWkWggGLXN81JS79zLoaAun48=;
        b=b8hI5nHRygzZsCshm5JrJ4Y9XQiB1ThNj/Vk7KNJvVZu3z1A9eIbbz0ntgyPh3XsAs
         4m3duPFKd6+m/8eghPrpZwnJRqtYyQtUoHKc6Cou7L5nhNaPeGLPAjMbiExr9BtwNvW4
         FRHCD4mEK2mYChDK8Q+RNpR4PTgeT2fdrma0wQKuacBIqDOjSJTDh9anMRctBqEmBx9V
         P8iufLoEslvdXWmj8Ky25RXnrXKcjVs7vcR/lP0b+6yicmW69mwiJ1ppo/qp5ltFb9GQ
         TePb81POIE2IhQj8f5cTdWPtG/Sk+JIPDntqnNjli4owokZCyfSpVbvfjbqdrPqXJRP8
         /zWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455046; x=1718059846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcVqu1Pw5jcbV1Kn0vjWkWggGLXN81JS79zLoaAun48=;
        b=OVPjg53KFyckPlNLmGUgmh6hH3K8ZwD/YSvBf/1MVyNk3N5iZMHEfBA7Z5cELn34B5
         jtjRl2zNBRWoyXV4lWcUUTfEGEQJY1QpUUrypHJyZLr0lxAq57BamnvDJII0ZZDz8rih
         +XNkkZL3R+sT7m9lWUms5d6ngzyWU3BjUnfcGUE3YXSyvLVvlAN6PBp9mnvfcwjssPUi
         4lynBEeDpL0FqzYbaxl9pQJGj1UlXS+i9kZHRD7c9UDNhMFOOsf9UJzLX1Q/hMsaFpAb
         3+wo/p6O7alY3Q7kguxFlj8IhEtJo7dy2VR2SWDTU4AmdfXNdtAMEosRsSJ8Rgt3piWy
         Xpog==
X-Gm-Message-State: AOJu0YyvI2dEkjkjpCtRo2R3p4kRuYuZpIMA0ZgrwzYd8A9pG4mJNdCC
	s7XcqVANGeempN4bbtv9+Ye0eu3IJ+qGa1yoWPn3u508FPBR21d/8TiyoUrU3kJthS7aoOeJNdB
	I
X-Google-Smtp-Source: AGHT+IHHM7lMb2LLpB6J0Kh7dD+lrTlsnvdTISLHJhdum9njYmIn6PFqMdOkrfj7xRMlKRJHPD6BoA==
X-Received: by 2002:a19:e05a:0:b0:51d:8d56:6b15 with SMTP id 2adb3069b0e04-52b8958ba20mr6195872e87.1.1717455045135;
        Mon, 03 Jun 2024 15:50:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d8016fsm1335726e87.214.2024.06.03.15.50.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 15:50:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dhrystone: fix building with the GCC 14
Date: Tue,  4 Jun 2024 01:50:44 +0300
Message-Id: <20240603225044.4098258-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 22:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110680

Update dhrystone sources to use C89 instead of K&R C in order to fix
build issues with the recent GCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../dhrystone-2.1/dhrystone-c89.patch         | 242 ++++++++++++++++++
 .../dhrystone/dhrystone_2.1.bb                |   4 +-
 2 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone-c89.patch

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone-c89.patch b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone-c89.patch
new file mode 100644
index 000000000000..faf710fe1286
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone-c89.patch
@@ -0,0 +1,242 @@
+dhrystone: make it speak C89
+
+Update Dhrystone sources to stop using K&R C and use something close to C89.
+This fixes compilation errors reported by the GCC 14.
+
+Upstream-Status: Pending
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+Index: dhrystone-2.1/dhry.h
+===================================================================
+--- dhrystone-2.1.orig/dhry.h
++++ dhrystone-2.1/dhry.h
+@@ -423,3 +423,13 @@ typedef struct record
+ #ifndef HZ
+    extern long HZ;
+ #endif
++
++void Proc_2 (One_Fifty   *Int_Par_Ref);
++void Proc_3 (Rec_Pointer *Ptr_Ref_Par);
++void Proc_4();
++void Proc_5();
++void Proc_6 (Enumeration  Enum_Val_Par, Enumeration *Enum_Ref_Par);
++void Proc_7 (One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val, One_Fifty *Int_Par_Ref);
++void Proc_8 (Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref, int Int_1_Par_Val, int Int_2_Par_Val);
++
++Boolean Func_2 (Str_30  Str_1_Par_Ref, Str_30  Str_2_Par_Ref);
+Index: dhrystone-2.1/dhry_1.c
+===================================================================
+--- dhrystone-2.1.orig/dhry_1.c
++++ dhrystone-2.1/dhry_1.c
+@@ -14,6 +14,8 @@
+  *
+  ****************************************************************************
+  */
++#include <stdlib.h>
++#include <string.h>
+ 
+ #include "dhry.h"
+ 
+@@ -28,7 +30,6 @@ char            Ch_1_Glob,
+ int             Arr_1_Glob [50];
+ int             Arr_2_Glob [50] [50];
+ 
+-extern char     *malloc ();
+ Enumeration     Func_1 ();
+   /* forward declaration necessary since Enumeration may not simply be int */
+ 
+@@ -41,6 +42,8 @@ Enumeration     Func_1 ();
+         Boolean Reg = true;
+ #endif
+ 
++void Proc_1 (REG Rec_Pointer Ptr_Val_Par);
++
+ /* variables for time measurement: */
+ 
+ #ifdef TIMES
+@@ -70,7 +73,7 @@ float           Microseconds,
+ /* end of variables for time measurement */
+ 
+ 
+-main ()
++int main (void)
+ /*****/
+ 
+   /* main program, corresponds to procedures        */
+@@ -218,7 +221,7 @@ main ()
+   printf ("Arr_2_Glob[8][7]:    %d\n", Arr_2_Glob[8][7]);
+   printf ("        should be:   Number_Of_Runs + 10\n");
+   printf ("Ptr_Glob->\n");
+-  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
++  printf ("  Ptr_Comp:          %lu\n", (unsigned long) Ptr_Glob->Ptr_Comp);
+   printf ("        should be:   (implementation-dependent)\n");
+   printf ("  Discr:             %d\n", Ptr_Glob->Discr);
+   printf ("        should be:   %d\n", 0);
+@@ -229,7 +232,7 @@ main ()
+   printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
+   printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
+   printf ("Next_Ptr_Glob->\n");
+-  printf ("  Ptr_Comp:          %d\n", (int) Next_Ptr_Glob->Ptr_Comp);
++  printf ("  Ptr_Comp:          %lu\n", (unsigned long) Next_Ptr_Glob->Ptr_Comp);
+   printf ("        should be:   (implementation-dependent), same as above\n");
+   printf ("  Discr:             %d\n", Next_Ptr_Glob->Discr);
+   printf ("        should be:   %d\n", 0);
+@@ -280,14 +283,13 @@ main ()
+     printf ("%6.1f \n", Dhrystones_Per_Second);
+     printf ("\n");
+   }
+-  
++  return 0;
+ }
+ 
+ 
+-Proc_1 (Ptr_Val_Par)
++void Proc_1 (REG Rec_Pointer Ptr_Val_Par)
+ /******************/
+ 
+-REG Rec_Pointer Ptr_Val_Par;
+     /* executed once */
+ {
+   REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;  
+@@ -318,12 +320,10 @@ REG Rec_Pointer Ptr_Val_Par;
+ } /* Proc_1 */
+ 
+ 
+-Proc_2 (Int_Par_Ref)
++void Proc_2 (One_Fifty   *Int_Par_Ref)
+ /******************/
+     /* executed once */
+     /* *Int_Par_Ref == 1, becomes 4 */
+-
+-One_Fifty   *Int_Par_Ref;
+ {
+   One_Fifty  Int_Loc;  
+   Enumeration   Enum_Loc;
+@@ -341,13 +341,10 @@ One_Fifty   *Int_Par_Ref;
+ } /* Proc_2 */
+ 
+ 
+-Proc_3 (Ptr_Ref_Par)
++void Proc_3 (Rec_Pointer *Ptr_Ref_Par)
+ /******************/
+     /* executed once */
+     /* Ptr_Ref_Par becomes Ptr_Glob */
+-
+-Rec_Pointer *Ptr_Ref_Par;
+-
+ {
+   if (Ptr_Glob != Null)
+     /* then, executed */
+@@ -356,7 +353,7 @@ Rec_Pointer *Ptr_Ref_Par;
+ } /* Proc_3 */
+ 
+ 
+-Proc_4 () /* without parameters */
++void Proc_4 () /* without parameters */
+ /*******/
+     /* executed once */
+ {
+@@ -368,7 +365,7 @@ Proc_4 () /* without parameters */
+ } /* Proc_4 */
+ 
+ 
+-Proc_5 () /* without parameters */
++void Proc_5 () /* without parameters */
+ /*******/
+     /* executed once */
+ {
+Index: dhrystone-2.1/dhry_2.c
+===================================================================
+--- dhrystone-2.1.orig/dhry_2.c
++++ dhrystone-2.1/dhry_2.c
+@@ -14,6 +14,7 @@
+  *
+  ****************************************************************************
+  */
++#include <string.h>
+ 
+ #include "dhry.h"
+ 
+@@ -26,14 +27,14 @@
+ extern  int     Int_Glob;
+ extern  char    Ch_1_Glob;
+ 
++Boolean Func_3 (Enumeration Enum_Par_Val);
+ 
+-Proc_6 (Enum_Val_Par, Enum_Ref_Par)
++
++void Proc_6 (Enumeration  Enum_Val_Par, Enumeration *Enum_Ref_Par)
+ /*********************************/
+     /* executed once */
+     /* Enum_Val_Par == Ident_3, Enum_Ref_Par becomes Ident_2 */
+ 
+-Enumeration  Enum_Val_Par;
+-Enumeration *Enum_Ref_Par;
+ {
+   *Enum_Ref_Par = Enum_Val_Par;
+   if (! Func_3 (Enum_Val_Par))
+@@ -61,7 +62,7 @@ Enumeration *Enum_Ref_Par;
+ } /* Proc_6 */
+ 
+ 
+-Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
++void Proc_7 (One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val, One_Fifty *Int_Par_Ref)
+ /**********************************************/
+     /* executed three times                                      */ 
+     /* first call:      Int_1_Par_Val == 2, Int_2_Par_Val == 3,  */
+@@ -70,9 +71,6 @@ Proc_7 (Int_1_Par_Val, Int_2_Par_Val, In
+     /*                  Int_Par_Ref becomes 17                   */
+     /* third call:      Int_1_Par_Val == 6, Int_2_Par_Val == 10, */
+     /*                  Int_Par_Ref becomes 18                   */
+-One_Fifty       Int_1_Par_Val;
+-One_Fifty       Int_2_Par_Val;
+-One_Fifty      *Int_Par_Ref;
+ {
+   One_Fifty Int_Loc;
+ 
+@@ -81,15 +79,11 @@ One_Fifty      *Int_Par_Ref;
+ } /* Proc_7 */
+ 
+ 
+-Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
++void Proc_8 (Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref, int Int_1_Par_Val, int Int_2_Par_Val)
+ /*********************************************************************/
+     /* executed once      */
+     /* Int_Par_Val_1 == 3 */
+     /* Int_Par_Val_2 == 7 */
+-Arr_1_Dim       Arr_1_Par_Ref;
+-Arr_2_Dim       Arr_2_Par_Ref;
+-int             Int_1_Par_Val;
+-int             Int_2_Par_Val;
+ {
+   REG One_Fifty Int_Index;
+   REG One_Fifty Int_Loc;
+@@ -132,14 +126,11 @@ Capital_Letter   Ch_2_Par_Val;
+ } /* Func_1 */
+ 
+ 
+-Boolean Func_2 (Str_1_Par_Ref, Str_2_Par_Ref)
++Boolean Func_2 (Str_30  Str_1_Par_Ref, Str_30  Str_2_Par_Ref)
+ /*************************************************/
+     /* executed once */
+     /* Str_1_Par_Ref == "DHRYSTONE PROGRAM, 1'ST STRING" */
+     /* Str_2_Par_Ref == "DHRYSTONE PROGRAM, 2'ND STRING" */
+-
+-Str_30  Str_1_Par_Ref;
+-Str_30  Str_2_Par_Ref;
+ {
+   REG One_Thirty        Int_Loc;
+       Capital_Letter    Ch_Loc;
+@@ -174,11 +165,10 @@ Str_30  Str_2_Par_Ref;
+ } /* Func_2 */
+ 
+ 
+-Boolean Func_3 (Enum_Par_Val)
++Boolean Func_3 (Enumeration Enum_Par_Val)
+ /***************************/
+     /* executed once        */
+     /* Enum_Par_Val == Ident_3 */
+-Enumeration Enum_Par_Val;
+ {
+   Enumeration Enum_Loc;
+ 
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index d809a564e923..5d27acbdc054 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -3,7 +3,9 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
 
 SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
-           file://dhrystone.patch"
+           file://dhrystone.patch \
+           file://dhrystone-c89.patch \
+"
 SRC_URI[md5sum] = "75aa5909c174eed98c134be2f56307da"
 SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
 
-- 
2.39.2


