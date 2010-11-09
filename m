Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PFxqp-0000gN-MS
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:43:44 +0100
Received: by pxi17 with SMTP id 17so7206pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=oEVQiuj1QvVAsmSraMLSDi8B7imRynlmUOu7HrKLX1w=;
	b=EJqcGqwRvVhUhWn+impp+wkZ1k+v1kFa261Z8kxoco6d/aNjLvxnCQv2y89Dc3LrXo
	tKbjsXAlEfXVvJaCSJzDzElk9J7LkyFPcvtCNPob0bFzOiPhCcdkm4UqkIhrgFQwqlM0
	DPeRx9BkVSkPUb0P2e+JuJU0xn3DbId/vzL5g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=WZy6h2E+Bw+gImXeRXv9WQ6HNwON24AEt46BJLUw79+C4Daq0E94ubAGTkStMUn3NH
	wC1dRN3DAU46H0kIFOa+9Rz3qIEtG5i8p7MfEQSD9qBPLZMR1YrmA+95xnxt72rrq4gl
	T+YluYohS0SB4OixAAk6Z7qbqwoQ7m5dujPsU=
Received: by 10.142.44.18 with SMTP id r18mr6857452wfr.170.1289346163954;
	Tue, 09 Nov 2010 15:42:43 -0800 (PST)
Received: from [10.0.0.71] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	v19sm2330123wfh.12.2010.11.09.15.42.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Nov 2010 15:42:43 -0800 (PST)
Message-ID: <4CD9DC6D.5090007@gmail.com>
Date: Wed, 10 Nov 2010 10:12:37 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] distro-version, kaeilos-version: don't export METADATA_BRANCH and METADATA_REVISION
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
X-List-Received-Date: Tue, 09 Nov 2010 23:43:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Causes infinite recursion, which may look like this:

NOTE: <type 'exceptions.RuntimeError'>:maximum recursion depth exceeded while calling a Python object while evaluating: ${@base_get_scm_branch(d)}

Or this:

Traceback (most recent call last):
 File "/home/grg/oe2/bitbake/lib/bb/server/none.py", line 128, in idle_commands
   retval = function(self, data, False)
 File "/home/grg/oe2/bitbake/lib/bb/cooker.py", line 716, in buildTargetsIdle
   retval = rq.execute_runqueue()
 File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 877, in execute_runqueue
   self.execute_runqueue_internal()
 File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 992, in execute_runqueue_internal
   self.build_pipes[pipe].read()
 File "/home/grg/oe2/bitbake/lib/bb/runqueue.py", line 1227, in read
   bb.event.fire_from_worker(self.queue[:index+8], self.d)
 File "/home/grg/oe2/bitbake/lib/bb/event.py", line 137, in fire_from_worker
   event = pickle.loads(event[7:-8])
 File "/usr/lib64/python2.6/pickle.py", line 1374, in loads
   return Unpickler(file).load()
 File "/usr/lib64/python2.6/pickle.py", line 858, in load
   dispatch[key](self)
 File "/usr/lib64/python2.6/pickle.py", line 966, in load_string
   raise ValueError, "insecure string pickle"
ValueError: insecure string pickle

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/distro-version/distro-version.bb |    3 ---
 recipes/kaeilos/kaeilos-version.bb       |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/recipes/distro-version/distro-version.bb b/recipes/distro-version/distro-version.bb
index 269186f..a189ec7 100644
--- a/recipes/distro-version/distro-version.bb
+++ b/recipes/distro-version/distro-version.bb
@@ -6,9 +6,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 PACKAGES = "${PN}"
 PACKAGE_ARCH = "all"
 
-export METADATA_REVISION
-export METADATA_BRANCH
-
 do_install() {
 	mkdir -p ${D}${sysconfdir}
 	echo "${DISTRO_NAME} ${DISTRO_VERSION}" > ${D}${sysconfdir}/${DISTRO}-version
diff --git a/recipes/kaeilos/kaeilos-version.bb b/recipes/kaeilos/kaeilos-version.bb
index 4600c41..7d226e6 100644
--- a/recipes/kaeilos/kaeilos-version.bb
+++ b/recipes/kaeilos/kaeilos-version.bb
@@ -7,9 +7,6 @@ PE = "1"
 PACKAGES = "${PN}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-export METADATA_REVISION
-export METADATA_BRANCH
-
 do_install() {
 	mkdir -p ${D}${sysconfdir}
 	echo "KaeilOS ${DISTRO_VERSION}" > ${D}${sysconfdir}/kaeilos-version
-- 
1.7.1



