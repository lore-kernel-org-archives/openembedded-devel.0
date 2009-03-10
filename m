Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piero.pezzin@gmail.com>) id 1Lh31g-0006rF-8g
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 15:33:48 +0100
Received: by fxm11 with SMTP id 11so1560052fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=0QuImfZ50FE3ZX4taoMDv3iq1RQteoaZXeplNtzr1yc=;
	b=Xea2QRA48Z/NXFlx9p6vP8JKPwXPjh1IVscu+TXXaWBo2MB17fxZG5n3A5Rm40DjAE
	OupGaS2fC/KhKs6mlM8i1KiegchSoACeYcuk6PHSReBWJ2RRETj6agowB6lLZt1b44dZ
	lyazg+QK+muX44kjCdc6pzZxIQC1wvlfldqwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Oqu7MkTHquiqMEUfwMzgpRxERbEDLrtPleZN38cC0GtGexsjaBrGThYhehQCPqNpKE
	QmUD2+9liSugKlXgUmi1+1t0gHuFxZibkn1NCsLg9JBHLk+c+Me7V2POyVu/5Ng+mvac
	OrYuheuO5byxai1ZdtDMGXARURLw6ZcQNTgl0=
MIME-Version: 1.0
Received: by 10.86.53.8 with SMTP id b8mr5055896fga.13.1236695625651; Tue, 10 
	Mar 2009 07:33:45 -0700 (PDT)
Date: Tue, 10 Mar 2009 15:33:45 +0100
Message-ID: <49bdfd00903100733s3af6dc2o48f09b48593fe51f@mail.gmail.com>
From: Piero Pezzin <piero.pezzin@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem building kernel - too many files open
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
X-List-Received-Date: Tue, 10 Mar 2009 14:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello everyone,

I'm building a minimal distribution for a x86 machine (my host is a x86-64
with CentOS 4.4):

OE Build Configuration:
BB_VERSION        = "1.8.12"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "a8a23e995d108ecdfc31129941671551c591bc6e"
TARGET_ARCH       = "i486"
TARGET_OS         = "linux"
MACHINE           = "x86"
DISTRO            = "minimal"
DISTRO_VERSION    = ".dev-snapshot-20090310"
TARGET_FPU        = ""


During kernel building, I got the following error:

OTE: package linux-2.6.28: started
NOTE: package linux-2.6.28-r6: task do_package: started
ERROR: Error in executing:
/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb
ERROR: Exception:exceptions.IOError Message:[Errno 24] Too many open files:
'/home/piero/work/qong-nobk/openembedded/build/tmp/work/x86-oe-linux/linux-2.6.28-r6/tmpQbp1Jr'
ERROR: Error in executing:
/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb
ERROR: Exception:exceptions.ImportError Message:No module named traceback
ERROR: Error in executing:
/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb
ERROR: Exception:exceptions.ImportError Message:No module named traceback
ERROR: Error in executing:
/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb
ERROR: Exception:exceptions.ImportError Message:No module named traceback
ERROR: Build of
/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb do_package failed
Traceback (most recent call last):
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", line 143,
in ?
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/bin/bitbake", line 140,
in main
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py", line
612, in cook
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py", line
514, in buildFile
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.py",
line 842, in execute_runqueue
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/runqueue.py",
line 951, in execute_runqueue_internal
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py", line
137, in tryBuild
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/cooker.py", line
111, in tryBuildPackage
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py", line
278, in exec_task
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py", line
113, in exec_func
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/build.py", line
136, in exec_func_python
  File "/home/piero/work/bitbake-nobk/bitbake-1.8.12/lib/bb/utils.py", line
186, in better_exec
ImportError: No module named traceback
ERROR: Task 12
(/home/piero/work/qong-nobk/openembedded/openembedded/packages/linux/
linux_2.6.28.bb, do_package) failed

Does anyone know what's happening?

Thanks in advance and best regards.

Piero

