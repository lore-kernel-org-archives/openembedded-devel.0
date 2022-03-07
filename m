Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EEEC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:58:02 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web09.25544.1646654281216077157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e/byZ7+7;
 spf=pass (domain: gmail.com, ip: 209.85.166.53,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id s20so3322147iol.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=swTmYYM6WMctGNZKvCNX51nGGyuxrEKktw2IZjO1Mqc=;
        b=e/byZ7+78fhGfxgU+xd0Memq/J0YU44OSyeyM00rJHAtlF3GsjGXAQq70RFKhVoIfX
         StiTZzQa8TdQwPypNaiBpciT+jRiM33oo8+gtwLT6FBZ4wFjH56ZW2w/Bla0VimsslBP
         JyU2wQknfAmo5g69jojxuKr8s1gG7Gqn70oclp3pcb10qIhnOZOaQMzIz4Up1sOYsIDY
         V7bhxpqKldpe1f1LO/hpztInviQ+jsYDo5MxswryRuo66uQPzAbJetB9AN1X/1cedWCa
         /+z4qm1WIbcOVWZcgW098fodh7FWwrGGQUBXoyteyb5edTomspRqVk3hCMNSts+EH3IW
         MS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=swTmYYM6WMctGNZKvCNX51nGGyuxrEKktw2IZjO1Mqc=;
        b=4gA781REpL+wpliu9nhnsLgIIiaOoPnAKSQIYfkoF24dQ73E/ZGIYNIStqBpuZk+j6
         vwJkw47kN4YUtT8jGA6onpPhfXfQLDzKww+ZNf3XEzgfiRt5gC20/cwq7vh1oQ6boly0
         99/ERV2FowfzhZ2SZwKjkYjiuquImL2Rr79Ana/09mbBWU+2mB2GNsajqupHnwVtLZUz
         E3+qQs6TpBoZ19wGv6pvhj5S28F1r9npSMKlvZULshQxbVc55e7jxs8PoDF2G+IMVrce
         y/00KQo1looFoUMxJKFNtK0L/EwYdmhAt4UdxQqUKK6K2BQFmvcSytKjgzfGQ6Ixtbs8
         su8A==
X-Gm-Message-State: AOAM532c+53nd3vG4+9xIbfe2SkzHik/LK/J1yBhbAu5QxIGj85rVqEs
	hQxTjGSfMTT6kZ7XDbbjuPEusDKn3J7gePj7M8s=
X-Google-Smtp-Source: 
 ABdhPJyOo3wVk0oswenONqBRH5cFH+KFxpZ0PM1PGtcbSTHSn8X3QgEysqe+9bFV7ZeUxS/lT7C8Nko7YbUlrM3Mc/8=
X-Received: by 2002:a02:5bc2:0:b0:317:b050:cba with SMTP id
 g185-20020a025bc2000000b00317b0500cbamr7422064jab.301.1646654280609; Mon, 07
 Mar 2022 03:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
 <6a14ee75-6c38-c7c4-7942-09db621ac036@gmail.com>
 <CAMKF1spcUmsW=1sVwH7jCXVaobTTLLQ7=3i1ODgVk3qf+Q3V7A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spcUmsW=1sVwH7jCXVaobTTLLQ7=3i1ODgVk3qf+Q3V7A@mail.gmail.com>
From: Nisha Parrakat <nishaparrakat@gmail.com>
Date: Mon, 7 Mar 2022 12:57:49 +0100
Message-ID: 
 <CAMR+Pi=XvodRYPJDkrk1AnThMQk+yEOxG=enAkYi2k+XzufOTw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][PATCH] libtinyxml2: fix packaging of test
 files
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="00000000000076f26a05d99f93d5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:58:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95846

--00000000000076f26a05d99f93d5
Content-Type: multipart/alternative; boundary="00000000000076f26805d99f93d3"

--00000000000076f26805d99f93d3
Content-Type: text/plain; charset="UTF-8"

HI Khem,

Could you please check the attached format-patch file attached with this
email to see if it works ?


regards

Nisha P




On 06.03.22 04:55, Khem Raj wrote:

this patch does not apply again
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1488

On Sat, Mar 5, 2022 at 1:49 PM akuster808 <akuster808@gmail.com>
<akuster808@gmail.com> wrote:

Nisha,

thanks for the patch. feedback in-lined below.

On 3/5/22 13:35, Nisha Parrakat wrote:

The xml files inside the resources are to be used for the
run of test named xmltest
they were not getting copied from the source directory to the directory
where xmltest was installed

fixes the below error when code built with cmake
./xmltest
Error opening test file 'dream.xml'.
Is your working directory the same as where
the xmltest.cpp and dream.xml file are?

Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)

This seems to confuse folks a lot. The "Upstream-Status" needs to be in
the patch it self, not the commit message.

see below.


Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
<nisha.m.parrakat@bmw.de>
---
  ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
  .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
  2 files changed, 33 insertions(+), 1 deletion(-)
  create mode 100644
meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch

diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
new file mode 100644
index 000000000..09245ad36
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
@@ -0,0 +1,30 @@
+The xml files inside the resources are to be used for the
+run of test named xmltest
+they were not getting copied from the source directory to the directory
+where xmltest was installed
+
+fixes the below error when code built with cmake
+./xmltest
+Error opening test file 'dream.xml'.
+Is your working directory the same as where
+the xmltest.cpp and dream.xml file are?

Here:

Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)


-armin

+
+Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
<nisha.m.parrakat@bmw.de>
+Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
<nishaparrakat@gmail.com>
+
+Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
+--- a/CMakeLists.txt 2022-03-05 22:00:33.361601287 +0100
++++ b/CMakelist.txt  2022-03-05 22:05:19.953940006 +0100
+@@ -51,6 +51,12 @@
+         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
+     )
+
++    # Copy test resources and create test output directory
++    add_custom_command(TARGET xmltest POST_BUILD
++    COMMAND ${CMAKE_COMMAND} -E copy_directory
${CMAKE_CURRENT_SOURCE_DIR}/resources
$<TARGET_FILE_DIR:xmltest>/resources
++    COMMAND ${CMAKE_COMMAND} -E make_directory
$<TARGET_FILE_DIR:xmltest>/resources/out
++    COMMENT "Configuring xmltest resources directory:
${CMAKE_CURRENT_BINARY_DIR}/resources"
++    )
+     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION
", Fail 0")
+ endif ()
+
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
index 7f205987f..06410ab6e 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
  LICENSE = "Zlib"
  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"

-SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https
\
+           file://copy_resources_with_tests_in_CMakelists.patch \
+          "

  SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95806):
https://lists.openembedded.org/g/openembedded-devel/message/95806
Mute This Topic: https://lists.openembedded.org/mt/89522514/3616698
Group Owner: openembedded-devel+owner@lists.openembedded.org
Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
[akuster808@gmail.com]
-=-=-=-=-=-=-=-=-=-=-=-

--00000000000076f26805d99f93d3
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">
  
    
  
  <div>
    <p>HI Khem,</p><p>Could you please check the attached format-patch file attached with this email to see if it works ?</p><p><br></p><p>regards</p><p>Nisha P<br></p><p><br></p><p><br></p><p><br>
    </p>
    <div>On 06.03.22 04:55, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite">
      <pre>this patch does not apply again

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1488" target="_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1488</a>

On Sat, Mar 5, 2022 at 1:49 PM akuster808 <a href="mailto:akuster808@gmail.com" target="_blank">&lt;akuster808@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre>Nisha,

thanks for the patch. feedback in-lined below.

On 3/5/22 13:35, Nisha Parrakat wrote:
</pre>
        <blockquote type="cite">
          <pre>The xml files inside the resources are to be used for the
run of test named xmltest
they were not getting copied from the source directory to the directory
where xmltest was installed

fixes the below error when code built with cmake
./xmltest
Error opening test file &#39;dream.xml&#39;.
Is your working directory the same as where
the xmltest.cpp and dream.xml file are?

Upstream-Status: Submitted (<a href="https://github.com/leethomason/tinyxml2/pull/902" target="_blank">https://github.com/leethomason/tinyxml2/pull/902</a>)
</pre>
        </blockquote>
        <pre>This seems to confuse folks a lot. The &quot;Upstream-Status&quot; needs to be in
the patch it self, not the commit message.

see below.

</pre>
        <blockquote type="cite">
          <pre>Signed-off-by: Nisha Parrakat <a href="mailto:nisha.m.parrakat@bmw.de" target="_blank">&lt;nisha.m.parrakat@bmw.de&gt;</a>
---
  ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
  .../libtinyxml2/<a href="http://libtinyxml2_9.0.0.bb" target="_blank">libtinyxml2_9.0.0.bb</a>          |  4 ++-
  2 files changed, 33 insertions(+), 1 deletion(-)
  create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch

diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
new file mode 100644
index 000000000..09245ad36
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
@@ -0,0 +1,30 @@
+The xml files inside the resources are to be used for the
+run of test named xmltest
+they were not getting copied from the source directory to the directory
+where xmltest was installed
+
+fixes the below error when code built with cmake
+./xmltest
+Error opening test file &#39;dream.xml&#39;.
+Is your working directory the same as where
+the xmltest.cpp and dream.xml file are?
</pre>
        </blockquote>
        <pre>Here:

Upstream-Status: Submitted (<a href="https://github.com/leethomason/tinyxml2/pull/902" target="_blank">https://github.com/leethomason/tinyxml2/pull/902</a>)


-armin
</pre>
        <blockquote type="cite">
          <pre>+
+Signed-off-by: Nisha Parrakat <a href="mailto:nisha.m.parrakat@bmw.de" target="_blank">&lt;nisha.m.parrakat@bmw.de&gt;</a>
+Signed-off-by: Nisha Parrakat <a href="mailto:nishaparrakat@gmail.com" target="_blank">&lt;nishaparrakat@gmail.com&gt;</a>
+
+Upstream-Status: Submitted (<a href="https://github.com/leethomason/tinyxml2/pull/902" target="_blank">https://github.com/leethomason/tinyxml2/pull/902</a>)
+--- a/CMakeLists.txt 2022-03-05 22:00:33.361601287 +0100
++++ b/CMakelist.txt  2022-03-05 22:05:19.953940006 +0100
+@@ -51,6 +51,12 @@
+         WORKING_DIRECTORY &quot;${CMAKE_CURRENT_SOURCE_DIR}&quot;
+     )
+
++    # Copy test resources and create test output directory
++    add_custom_command(TARGET xmltest POST_BUILD
++    COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $&lt;TARGET_FILE_DIR:xmltest&gt;/resources
++    COMMAND ${CMAKE_COMMAND} -E make_directory $&lt;TARGET_FILE_DIR:xmltest&gt;/resources/out
++    COMMENT &quot;Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources&quot;
++    )
+     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION &quot;, Fail 0&quot;)
+ endif ()
+
diff --git a/meta-oe/recipes-support/libtinyxml2/<a href="http://libtinyxml2_9.0.0.bb" target="_blank">libtinyxml2_9.0.0.bb</a> b/meta-oe/recipes-support/libtinyxml2/<a href="http://libtinyxml2_9.0.0.bb" target="_blank">libtinyxml2_9.0.0.bb</a>
index 7f205987f..06410ab6e 100644
--- a/meta-oe/recipes-support/libtinyxml2/<a href="http://libtinyxml2_9.0.0.bb" target="_blank">libtinyxml2_9.0.0.bb</a>
+++ b/meta-oe/recipes-support/libtinyxml2/<a href="http://libtinyxml2_9.0.0.bb" target="_blank">libtinyxml2_9.0.0.bb</a>
@@ -4,7 +4,9 @@ SECTION = &quot;libs&quot;
  LICENSE = &quot;Zlib&quot;
  LIC_FILES_CHKSUM = <a>&quot;file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd&quot;</a>

-SRC_URI = &quot;git://<a href="http://github.com/leethomason/tinyxml2.git;branch=master;protocol=https" target="_blank">github.com/leethomason/tinyxml2.git;branch=master;protocol=https</a>&quot;
+SRC_URI = &quot;git://<a href="http://github.com/leethomason/tinyxml2.git;branch=master;protocol=https" target="_blank">github.com/leethomason/tinyxml2.git;branch=master;protocol=https</a> \
+           <a>file://copy_resources_with_tests_in_CMakelists.patch</a> \
+          &quot;

  SRCREV = &quot;1dee28e51f9175a31955b9791c74c430fe13dc82&quot;


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#95806): <a href="https://lists.openembedded.org/g/openembedded-devel/message/95806" target="_blank">https://lists.openembedded.org/g/openembedded-devel/message/95806</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/89522514/3616698" target="_blank">https://lists.openembedded.org/mt/89522514/3616698</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org" target="_blank">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub" target="_blank">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:akuster808@gmail.com" target="_blank">akuster808@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
        <pre></pre>
      </blockquote>
    </blockquote>
  </div>

</div>

--00000000000076f26805d99f93d3--

--00000000000076f26a05d99f93d5
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-libtinyxml2-fix-packaging-of-test-files.patch"
Content-Disposition: attachment;
	filename="0001-libtinyxml2-fix-packaging-of-test-files.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l0gneurq0>
X-Attachment-Id: f_l0gneurq0

RnJvbSBkZWM0ZDFlMjMyZWNlZTc5MzgwNjBkMTJjMGU0ZTM2NjU4MTlhMWY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaXNoYSBQYXJyYWthdCA8bmlzaGEubS5wYXJyYWthdEBibXcu
ZGU+CkRhdGU6IFdlZCwgMiBNYXIgMjAyMiAyMzo0NzozNyArMDEwMApTdWJqZWN0OiBbUEFUQ0hd
IGxpYnRpbnl4bWwyOiBmaXggcGFja2FnaW5nIG9mIHRlc3QgZmlsZXMKClRoZSB4bWwgZmlsZXMg
aW5zaWRlIHRoZSByZXNvdXJjZXMgYXJlIHRvIGJlIHVzZWQgZm9yIHRoZQpydW4gb2YgdGVzdCBu
YW1lZCB4bWx0ZXN0CnRoZXkgd2VyZSBub3QgZ2V0dGluZyBjb3BpZWQgZnJvbSB0aGUgc291cmNl
IGRpcmVjdG9yeSB0byB0aGUgZGlyZWN0b3J5CndoZXJlIHhtbHRlc3Qgd2FzIGluc3RhbGxlZAoK
Zml4ZXMgdGhlIGJlbG93IGVycm9yIHdoZW4gY29kZSBidWlsdCB3aXRoIGNtYWtlCi4veG1sdGVz
dApFcnJvciBvcGVuaW5nIHRlc3QgZmlsZSAnZHJlYW0ueG1sJy4KSXMgeW91ciB3b3JraW5nIGRp
cmVjdG9yeSB0aGUgc2FtZSBhcyB3aGVyZQp0aGUgeG1sdGVzdC5jcHAgYW5kIGRyZWFtLnhtbCBm
aWxlIGFyZT8KClNpZ25lZC1vZmYtYnk6IE5pc2hhIFBhcnJha2F0IDxuaXNoYS5tLnBhcnJha2F0
QGJtdy5kZT4KLS0tCiAuLi55X3Jlc291cmNlc193aXRoX3Rlc3RzX2luX0NNYWtlbGlzdHMucGF0
Y2ggfCAzMSArKysrKysrKysrKysrKysrKysrCiAuLi4vbGlidGlueXhtbDIvbGlidGlueXhtbDJf
OS4wLjAuYmIgICAgICAgICAgfCAgNCArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L2xpYnRpbnl4bWwyL2ZpbGVzL2NvcHlfcmVzb3VyY2VzX3dpdGhfdGVzdHNfaW5fQ01h
a2VsaXN0cy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnRp
bnl4bWwyL2ZpbGVzL2NvcHlfcmVzb3VyY2VzX3dpdGhfdGVzdHNfaW5fQ01ha2VsaXN0cy5wYXRj
aCBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnRpbnl4bWwyL2ZpbGVzL2NvcHlfcmVzb3Vy
Y2VzX3dpdGhfdGVzdHNfaW5fQ01ha2VsaXN0cy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAuLmFjMDVkYzJhZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEtb2UvcmVj
aXBlcy1zdXBwb3J0L2xpYnRpbnl4bWwyL2ZpbGVzL2NvcHlfcmVzb3VyY2VzX3dpdGhfdGVzdHNf
aW5fQ01ha2VsaXN0cy5wYXRjaApAQCAtMCwwICsxLDMxIEBACitUaGUgeG1sIGZpbGVzIGluc2lk
ZSB0aGUgcmVzb3VyY2VzIGFyZSB0byBiZSB1c2VkIGZvciB0aGUKK3J1biBvZiB0ZXN0IG5hbWVk
IHhtbHRlc3QKK3RoZXkgd2VyZSBub3QgZ2V0dGluZyBjb3BpZWQgZnJvbSB0aGUgc291cmNlIGRp
cmVjdG9yeSB0byB0aGUgZGlyZWN0b3J5Cit3aGVyZSB4bWx0ZXN0IHdhcyBpbnN0YWxsZWQKKwor
Zml4ZXMgdGhlIGJlbG93IGVycm9yIHdoZW4gY29kZSBidWlsdCB3aXRoIGNtYWtlCisuL3htbHRl
c3QKK0Vycm9yIG9wZW5pbmcgdGVzdCBmaWxlICdkcmVhbS54bWwnLgorSXMgeW91ciB3b3JraW5n
IGRpcmVjdG9yeSB0aGUgc2FtZSBhcyB3aGVyZQordGhlIHhtbHRlc3QuY3BwIGFuZCBkcmVhbS54
bWwgZmlsZSBhcmU/CisKK1NpZ25lZC1vZmYtYnk6IE5pc2hhIFBhcnJha2F0IDxuaXNoYS5tLnBh
cnJha2F0QGJtdy5kZT4KK1NpZ25lZC1vZmYtYnk6IE5pc2hhIFBhcnJha2F0IDxuaXNoYXBhcnJh
a2F0QGdtYWlsLmNvbT4KKworVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgKGh0dHBzOi8vZ2l0
aHViLmNvbS9sZWV0aG9tYXNvbi90aW55eG1sMi9wdWxsLzkwMikKKy0tLSBhL0NNYWtlTGlzdHMu
dHh0CTIwMjItMDMtMDEgMTI6Mjg6NDYuNzgwNDQ3NTQyICswMDAwCisrKysgYi9DTWFrZUxpc3Rz
LnR4dAkyMDIyLTAzLTAxIDEyOjI4OjU1Ljk1MTk1MTQ3OCArMDAwMAorQEAgLTUwLDcgKzUwLDEy
IEBACisgICAgICAgICBDT01NQU5EIHhtbHRlc3QNCisgICAgICAgICBXT1JLSU5HX0RJUkVDVE9S
WSAiJHtDTUFLRV9DVVJSRU5UX1NPVVJDRV9ESVJ9Ig0KKyAgICAgKQ0KKy0NCisrICAgICAjIENv
cHkgdGVzdCByZXNvdXJjZXMgYW5kIGNyZWF0ZSB0ZXN0IG91dHB1dCBkaXJlY3RvcnkKKysgICAg
YWRkX2N1c3RvbV9jb21tYW5kKFRBUkdFVCB4bWx0ZXN0IFBPU1RfQlVJTEQKKysgICAgICAgIENP
TU1BTkQgJHtDTUFLRV9DT01NQU5EfSAtRSBjb3B5X2RpcmVjdG9yeSAke0NNQUtFX0NVUlJFTlRf
U09VUkNFX0RJUn0vcmVzb3VyY2VzICQ8VEFSR0VUX0ZJTEVfRElSOnhtbHRlc3Q+L3Jlc291cmNl
cworKyAgICAgICAgQ09NTUFORCAke0NNQUtFX0NPTU1BTkR9IC1FIG1ha2VfZGlyZWN0b3J5ICQ8
VEFSR0VUX0ZJTEVfRElSOnhtbHRlc3Q+L3Jlc291cmNlcy9vdXQKKysgICAgICAgIENPTU1FTlQg
IkNvbmZpZ3VyaW5nIHhtbHRlc3QgcmVzb3VyY2VzIGRpcmVjdG9yeTogJHtDTUFLRV9DVVJSRU5U
X0JJTkFSWV9ESVJ9L3Jlc291cmNlcyIKKysgICAgKSAKKyAgICAgc2V0X3Rlc3RzX3Byb3BlcnRp
ZXMoeG1sdGVzdCBQUk9QRVJUSUVTIFBBU1NfUkVHVUxBUl9FWFBSRVNTSU9OICIsIEZhaWwgMCIp
DQorIGVuZGlmICgpDQorIA0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xp
YnRpbnl4bWwyL2xpYnRpbnl4bWwyXzkuMC4wLmJiIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
bGlidGlueXhtbDIvbGlidGlueXhtbDJfOS4wLjAuYmIKaW5kZXggN2YyMDU5ODdmLi4wNjQxMGFi
NmUgMTAwNjQ0Ci0tLSBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnRpbnl4bWwyL2xpYnRp
bnl4bWwyXzkuMC4wLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYnRpbnl4bWwy
L2xpYnRpbnl4bWwyXzkuMC4wLmJiCkBAIC00LDcgKzQsOSBAQCBTRUNUSU9OID0gImxpYnMiCiBM
SUNFTlNFID0gIlpsaWIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MTM1NjI0ZWVmMDNlMWYxMTAxYjliYTlhYzliNWZmZmQiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9sZWV0aG9tYXNvbi90aW55eG1sMi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9sZWV0aG9tYXNvbi90aW55eG1s
Mi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGZpbGU6Ly9j
b3B5X3Jlc291cmNlc193aXRoX3Rlc3RzX2luX0NNYWtlbGlzdHMucGF0Y2ggXAorICAgICAgICAg
ICIKIAogU1JDUkVWID0gIjFkZWUyOGU1MWY5MTc1YTMxOTU1Yjk3OTFjNzRjNDMwZmUxM2RjODIi
CiAKLS0gCjIuMTcuMQoK
--00000000000076f26a05d99f93d5--

