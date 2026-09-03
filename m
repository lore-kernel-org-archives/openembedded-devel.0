Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD1AC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:45 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4201.1788429040133311591
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fTstgBzl;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1325367b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429039; x=1789033839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BojN+3uh6U69TPkdF2Nehebt1u0ViF0aUWl0yL6dYg=;
        b=fTstgBzl80PROU3O7migXVAsIzDBdhWoZqlJI9j1WP/davvGc9KO6dpVTl1yMzawIO
         CcmdA42aotfHj93gvbnnQ7PUtV9V7O9UkbFGnzLnFHF0LGcHGUQEwVhbIa7Tl1+Jt/0c
         zV436/3s64AD0Ov7CTzFelt1ht6ERcHN41OEeT0klreyQdBfFkhn/Gj69PCMGYSBjBUM
         9bLyukCFVpzl71w3PrtyXV+VPoST29uct0mnq1MHO+/eugwjsB3BQnoYRBqR6exsQQWE
         ZuYJg3cCUVQuPa4MF+dfA30SNAsAf8+uWUQxPrI25gVKVv+TTxMmVEFIdFZNu7AHYjmZ
         9+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429039; x=1789033839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BojN+3uh6U69TPkdF2Nehebt1u0ViF0aUWl0yL6dYg=;
        b=L0KPygOiZkrzG4DHtmUNolbrR70rQWNVj/W15m+2HvEiqmI7inDou+ORcNB1GWBBgL
         PC8DsqRLfoiUo2Lr49i4Wu7Rz1CLMmIE3BBFBjbOlnh14iaURYnBFbtUbVjjfAs0cJWo
         SmgSz1Y4aeKdfQWXkbGQZ981qPW94qdHfmEG1yPAlqWUsldqlQBLrB02h4P/IyQrwJgz
         Dz15QF8oLQW9C5QNthGVcCoj2/g3tbhYdU4EWIBIgtitZCeu+ZHGUeHqBueWOGr2eQ7C
         ckavG9AJbzFV8wjFGMDco9bAAmDFALf8h57CpjnxscX2COsIY0K+tg5nVcK95d5MVPy9
         anmg==
X-Gm-Message-State: AFuF++luXSDzlxsA1WPsejfW3K6x16xyZ7tINCFmDstCmObtp+H/YQz9
	sYP192boPDMGIhwvVQUM4Rl3vktv8k6yAIgrwLNmjEoKoVO7O4sciDxt4gBz8p6Z
X-Gm-Gg: AYBFou2cOVn2jZy/RF6b6L5m0ogc+Lv9L3lcAp/AZMvSx5djnlGl3oI1o8caqRNsqiz
	beGKSjjXfOPRH8A0wj9D7BLoggjuVfugbCEluEJ8AMh0O9yXvkoaH7/nFT3kVliQ6Oe1s4VtRez
	M4NPArnxSMLgtjrf/rHWR/6Lduts4uVkq2YcW61dksai8F4mC8GjiomC+UEbeyNpio0uflTYxI6
	6BSGwuUkCplOCPPAB0KIJUdab/pWhUCf2Jql1IbA8FLhUiw+irdcCV9vKEzvlq6pa38jGShnKMT
	YA2sxpi6Hk3hCpVOsWDnS5ZI299B8ZFK9SjVJOxgDhcyklP8Lab4gGJEc4W1iHuVzvlmYA2tdsy
	SSSRNoM0PvYGiyFiWoeWvSS2LDO81kjIXw0D5v6ewvp+6lo0mmmFU4VIHc25oR5loXrcBDDaHjg
	1JZpOBptqfuvt2a6S05urdgVwJALt1mvnanTlxKKLwiXV01XtWsnIYlDGoumEokYiwM/VKBde4
X-Received: by 2002:a05:6a00:4408:b0:857:4dea:e2fe with SMTP id d2e1a72fcca58-85ed8ed8414mr17201121b3a.13.1788429039383;
        Thu, 03 Sep 2026 02:50:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 18/22] libiec61850: patch CVE-2026-19108
Date: Thu,  3 Sep 2026 21:49:49 +1200
Message-ID: <20260903094954.3240723-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129734

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-19108

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/files/CVE-2026-19108.patch    | 208 ++++++++++++++++++
 .../libiec61850/libiec61850_1.6.1.bb          |   1 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.patch

diff --git a/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.patch b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.patch
new file mode 100644
index 0000000000..673ce29af0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libiec61850/files/CVE-2026-19108.patch
@@ -0,0 +1,208 @@
+From 846bd407527061665a3c109eaa6ee7e870ae6bc1 Mon Sep 17 00:00:00 2001
+From: Michael Zillgith <michael.zillgith@mz-automation.de>
+Date: Tue, 21 Jul 2026 10:26:33 +0000
+Subject: [PATCH] - MMS server: fixed - Update URCB that used an association
+ specific dataset of another connection can cause heap-use-after-free
+ (LIB61850-577)(#596) - fixed bitbucket sonarcloud pipeline
+
+(cherry picked from commit 486fd57f3aed65bb9d636ff00f9ddce2e450b168)
+
+CVE: CVE-2026-19108
+Upstream-Status: Backport [https://github.com/mz-automation/libiec61850/commit/486fd57f3aed65bb9d636ff00f9ddce2e450b168]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ bitbucket-pipelines.yml                       | 11 +++----
+ src/iec61850/inc_private/reporting.h          |  1 +
+ src/iec61850/server/mms_mapping/mms_mapping.c | 29 +++++++++++++++++--
+ src/iec61850/server/mms_mapping/reporting.c   | 17 +++++++----
+ .../iso_mms/server/mms_server_connection.c    | 19 ++++++++++++
+ 5 files changed, 65 insertions(+), 12 deletions(-)
+
+diff --git a/bitbucket-pipelines.yml b/bitbucket-pipelines.yml
+index a7493663..30dce281 100644
+--- a/bitbucket-pipelines.yml
++++ b/bitbucket-pipelines.yml
+@@ -1,4 +1,4 @@
+-image:  atlassian/default-image:4
++image:  atlassian/default-image:5
+ 
+ clone:
+   depth: full              # SonarCloud scanner needs the full history to assign issues properly
+@@ -12,12 +12,13 @@ definitions:
+         caches:
+           - sonar
+         script:
+-          - export SONAR_SCANNER_VERSION=5.0.1.3006
+-          - export SONAR_SCANNER_OPTS="-Dsonar.javaHome=/usr/lib/jvm/java-17-openjdk-amd64"
+-          - export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux
++          - export SONAR_SCANNER_VERSION=6.2.1.4610
++          - export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-linux-x64
+           - export BW_OUTPUT=$HOME/.sonar/bw-output
+           - mkdir -p $BW_OUTPUT
+-          - curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip
++          - apt-get update -qq
++          - apt-get install openjdk-21-jre cmake -y
++          - curl --create-dirs -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux-x64.zip
+           - unzip -o $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
+           - export PATH=$SONAR_SCANNER_HOME/bin:$PATH
+           - curl --create-dirs -sSLo $HOME/.sonar/build-wrapper-linux-x86.zip https://sonarcloud.io/static/cpp/build-wrapper-linux-x86.zip
+diff --git a/src/iec61850/inc_private/reporting.h b/src/iec61850/inc_private/reporting.h
+index eddeb2d1..bc23f937 100644
+--- a/src/iec61850/inc_private/reporting.h
++++ b/src/iec61850/inc_private/reporting.h
+@@ -67,6 +67,7 @@ typedef struct {
+     bool buffered; /* true if report is a buffered report */
+ 
+     MmsValue** bufferedDataSetValues; /* used to buffer values during bufTm time */
++    int bufferedDataSetValuesSize; /* number of dataset entries */
+ 
+     MmsValue** valueReferences; /* array to store value references for fast access */
+ 
+diff --git a/src/iec61850/server/mms_mapping/mms_mapping.c b/src/iec61850/server/mms_mapping/mms_mapping.c
+index 5620f63f..ef6f3580 100644
+--- a/src/iec61850/server/mms_mapping/mms_mapping.c
++++ b/src/iec61850/server/mms_mapping/mms_mapping.c
+@@ -3912,6 +3912,10 @@ variableListAccessHandler (void* parameter, MmsVariableListAccessType accessType
+             {
+                 ReportControl* rc = (ReportControl*) rcElement->data;
+ 
++#if (CONFIG_MMS_THREADLESS_STACK != 1)
++                Semaphore_wait(rc->rcbValuesLock);
++#endif
++
+                 if (rc->isDynamicDataSet)
+                 {
+                     if (rc->dataSet != NULL)
+@@ -3924,6 +3928,11 @@ variableListAccessHandler (void* parameter, MmsVariableListAccessType accessType
+                                 {
+                                     if (strcmp(rc->dataSet->logicalDeviceName, MmsDomain_getName(domain) + strlen(self->model->name)) == 0)
+                                     {
++#if (CONFIG_MMS_THREADLESS_STACK != 1)
++                                        Semaphore_post(rc->rcbValuesLock);
++#endif
++
++                                        /* dataset is in use and cannot be deleted */
+                                         allow = MMS_ERROR_SERVICE_OBJECT_CONSTRAINT_CONFLICT;
+                                         break;
+                                     }
+@@ -3936,6 +3945,10 @@ variableListAccessHandler (void* parameter, MmsVariableListAccessType accessType
+                             {
+                                 if (strcmp(rc->dataSet->name, listName) == 0)
+                                 {
++#if (CONFIG_MMS_THREADLESS_STACK != 1)
++                                    Semaphore_post(rc->rcbValuesLock);
++#endif
++                                    /* dataset is in use and cannot be deleted */
+                                     allow = MMS_ERROR_SERVICE_OBJECT_CONSTRAINT_CONFLICT;
+                                     break;
+                                 }
+@@ -3947,13 +3960,22 @@ variableListAccessHandler (void* parameter, MmsVariableListAccessType accessType
+                             {
+                                 if (strcmp(rc->dataSet->name, listName) == 0)
+                                 {
+-                                    allow = MMS_ERROR_SERVICE_OBJECT_CONSTRAINT_CONFLICT;
+-                                    break;
++                                    /* this is usually called when the connection is closed -> RCB has already been disabled by connection handler */
++
++                                    MmsMapping_freeDynamicallyCreatedDataSet(rc->dataSet);
++
++                                    /* cleanup dataset information in RCB instance */
++                                    rc->dataSet = NULL;
++                                    rc->isDynamicDataSet = false;
+                                 }
+                             }
+                         }
+                     }
+                 }
++
++#if (CONFIG_MMS_THREADLESS_STACK != 1)
++                Semaphore_post(rc->rcbValuesLock);
++#endif
+             }
+ 
+ #if (CONFIG_IEC61850_LOG_SERVICE == 1)
+@@ -4729,6 +4751,9 @@ MmsMapping_getDomainSpecificDataSet(MmsMapping* self, const char* dataSetName)
+ void
+ MmsMapping_freeDynamicallyCreatedDataSet(DataSet* dataSet)
+ {
++    if (dataSet == NULL)
++        return;
++
+     DataSetEntry* dataSetEntry = dataSet->fcdas;
+ 
+     while (dataSetEntry)
+diff --git a/src/iec61850/server/mms_mapping/reporting.c b/src/iec61850/server/mms_mapping/reporting.c
+index a44f0583..03add555 100644
+--- a/src/iec61850/server/mms_mapping/reporting.c
++++ b/src/iec61850/server/mms_mapping/reporting.c
+@@ -193,13 +193,9 @@ deleteDataSetValuesShadowBuffer(ReportControl* self)
+ {
+     if (self->bufferedDataSetValues != NULL)
+     {
+-        assert(self->dataSet != NULL);
+-
+-        int dataSetSize = DataSet_getSize(self->dataSet);
+-
+         int i;
+ 
+-        for (i = 0; i < dataSetSize; i++)
++        for (i = 0; i < self->bufferedDataSetValuesSize; i++)
+         {
+             if (self->bufferedDataSetValues[i] != NULL)
+                 MmsValue_delete(self->bufferedDataSetValues[i]);
+@@ -698,13 +694,24 @@ static void
+ createDataSetValuesShadowBuffer(ReportControl* rc)
+ {
+     int dataSetSize = DataSet_getSize(rc->dataSet);
++    rc->bufferedDataSetValuesSize = dataSetSize;
+ 
+     MmsValue** dataSetValues = (MmsValue**)GLOBAL_CALLOC(dataSetSize, sizeof(MmsValue*));
+ 
++    if (dataSetValues == NULL)
++        return;
++
+     rc->bufferedDataSetValues = dataSetValues;
+ 
+     rc->valueReferences = (MmsValue**)GLOBAL_MALLOC(dataSetSize * sizeof(MmsValue*));
+ 
++    if (rc->valueReferences == NULL)
++    {
++        GLOBAL_FREEMEM(dataSetValues);
++        rc->bufferedDataSetValues = NULL;
++        return;
++    }
++
+     DataSetEntry* dataSetEntry = rc->dataSet->fcdas;
+ 
+     int i;
+diff --git a/src/mms/iso_mms/server/mms_server_connection.c b/src/mms/iso_mms/server/mms_server_connection.c
+index 644fcdb1..401ad40b 100644
+--- a/src/mms/iso_mms/server/mms_server_connection.c
++++ b/src/mms/iso_mms/server/mms_server_connection.c
+@@ -829,6 +829,25 @@ MmsServerConnection_destroy(MmsServerConnection self)
+ #endif
+ 
+ #if (MMS_DYNAMIC_DATA_SETS == 1)
++    /* notify IEC 61850 layer BEFORE destroying named variable lists */
++    if (self->namedVariableLists)
++    {
++        LinkedList element = LinkedList_getNext(self->namedVariableLists);
++
++        while (element)
++        {
++            MmsNamedVariableList variableList = (MmsNamedVariableList)element->data;
++
++            if (variableList && variableList->name)
++            {
++                mmsServer_callVariableListChangedHandler(MMS_VARLIST_DELETE, MMS_ASSOCIATION_SPECIFIC,
++                                                            NULL, /* domain (NULL for aa-specific) */
++                                                            variableList->name, self);
++            }
++            element = LinkedList_getNext(element);
++        }
++    }
++
+     LinkedList_destroyDeep(self->namedVariableLists, (LinkedListValueDeleteFunction) MmsNamedVariableList_destroy);
+ #endif
+ 
diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
index 408b4d2d11..c0e6efedd6 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
            file://CVE-2026-18582.patch \
            file://CVE-2026-18583.patch \
+           file://CVE-2026-19108.patch \
 "
 
 

