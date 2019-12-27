Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CCA276D6DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577446382; x=1608982382;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=aonRx8SHTt/remMn97ZAilQ8WCWwNqCst9iZfHrjTzw=;
	b=bV+b92LjPzdajw/kdADPXmrwZv/REquAXEknzYTyPSATFv9mERtHZniC
	XyfDq0seYGIVmQRmYjTjmNelmYKv6x3B/U14GoXa4nreGf8K/X9kbV466
	kZR8Q/Qu2GqzAAfH5uRBNsQC9P8Qh1TkbAgIxiy8lf8uUAcsIKV9OBt+I
	Q2vEejRP08RX15GK54iyV2GZZTuJkSp9CgQExMiUGck1hp+4KBEqGw3jS
	TCPxmrOnn8qTskuJ6uROIESyO3XM8bXEuL52CF1peQa9jaCKLcTPIPeBZ
	SDJO95MIZ+C9e8NH/K40LjCTKNOyN/JQB1/lxUSBLwTJA4Ajx/vjM8GIE w==;
IronPort-SDR: hkEUyLSTHKn4+GoUJiqkbyPeAJBDT6ZBQrTeg862OR43sD8co9gm2JLA0pekGTibN30vdvfpJI
	S9NYui9crISTZDmujn6bJsGzRlMyYW9REwmqq0/Vgz/dLK2/ySkvMd+RGAL1ovMlH3m+tnoiNQ
	kl8XJzH+7lkSJ81WEgErX1zOZtT9I8xGHdK8Pl/6iMDhruNB1PPjzsmZpdYjsPE3RGGaR4pWEp
	4tmE/6uaRjsIgstb8zoWf0r8nbUYt6qHkHKcNXNvp137nKt7CK7RqgAUHy3qTXSg8TWO63gRFB
	1yQ=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472793"
To: <mohamad.noor.alim.hussin@intel.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191227082053.26882-1-mohamad.noor.alim.hussin@intel.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <f2de9138-e8ca-7c2c-c0e1-eb644914db2d@skidata.com>
Date: Fri, 27 Dec 2019 12:33:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191227082053.26882-1-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH v2] openjdk-12: Add new recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 11:33:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Mohamad,
thanks for the patch.

Please find my comments below.

On 27/12/2019 09:20, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> Openjdk-12 is implementation of Java SE 12.
> This recipe taken from branch jdk12u on release 12.0.2+10 [1].
> Openjdk-12 can compile with glibc on x86_64, x86 and aarch64. Compiling
> against musl is not working.
> 
> Some highlight features for openjdk-12 taken from [2-9]
>      189: 	Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)
>      230: 	Microbenchmark Suite
>      325: 	Switch Expressions (Preview)
>      334: 	JVM Constants API
>      340: 	One AArch64 Port, Not Two
>      341: 	Default CDS Archives
>      344: 	Abortable Mixed Collections for G1
>      346: 	Promptly Return Unused Committed Memory from G1
> 
> For more information see source code at [10].
> 
> References
> [1] https://openjdk.java.net/projects/jdk/12/
> [2] https://openjdk.java.net/jeps/189
> [3] https://openjdk.java.net/jeps/230
> [4] https://openjdk.java.net/jeps/325
> [5] https://openjdk.java.net/jeps/334
> [6] https://openjdk.java.net/jeps/340
> [7] https://openjdk.java.net/jeps/341
> [8] https://openjdk.java.net/jeps/344
> [9] https://openjdk.java.net/jeps/346
> [10] https://hg.openjdk.java.net/jdk-updates/jdk12u/rev/7b6accc7c009
> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>   lib/oeqa/files/hello.java                     |   5 +
>   lib/oeqa/runtime/cases/java.py                |  16 ++
>   lib/oeqa/runtime/cases/javac.py               |  27 ++-
>   recipes-core/openjdk/openjdk-12-common.inc    | 158 ++++++++++++++++++
>   recipes-core/openjdk/openjdk-12-cross.inc     | 145 ++++++++++++++++
>   recipes-core/openjdk/openjdk-12-native.inc    |  86 ++++++++++
>   .../openjdk/openjdk-12-native_2+10.bb         |   2 +
>   .../openjdk-12-release-2+10-aarch32.inc       |  15 ++
>   .../openjdk-12-release-2+10-aarch64.inc       |  12 ++
>   .../openjdk-12-release-2+10-common.inc        |  35 ++++
>   .../openjdk/openjdk-12-release-2+10.inc       |  11 ++
>   recipes-core/openjdk/openjdk-12_2+10.bb       |  57 +++++++
>   recipes-core/openjdk/openjre-12_2+10.bb       |  54 ++++++
>   .../0001-fix-stringop-truncate-gcc8.patch     |  11 ++
>   .../0002-fix-stringop-truncate-gcc8.patch     |  38 +++++
>   .../filter-aclocal-copy-too.patch             |  10 ++
>   .../openjdk/patches-openjdk-12/jvm.cfg        |  41 +++++
>   ...njdk12-find-compiler-fix-env-respect.patch |  11 ++
>   ...move-shell-variables-from-autoheader.patch |  28 ++++
>   .../images/openjdk-12-test-image.bb           |   3 +
>   .../images/openjre-12-test-image.bb           |   3 +
>   21 files changed, 764 insertions(+), 4 deletions(-)
>   create mode 100644 lib/oeqa/files/hello.java
>   create mode 100644 recipes-core/openjdk/openjdk-12-common.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-cross.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-native.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-native_2+10.bb
>   create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch32.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-aarch64.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10-common.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12-release-2+10.inc
>   create mode 100644 recipes-core/openjdk/openjdk-12_2+10.bb
>   create mode 100644 recipes-core/openjdk/openjre-12_2+10.bb

Is there a reason for representing the version in this format?

Currently opendjk 7 & 8 use <XX>b<YY>, isn't this applicable for OpenJDK12?

>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/0001-fix-stringop-truncate-gcc8.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/0002-fix-stringop-truncate-gcc8.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/filter-aclocal-copy-too.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/jvm.cfg
>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/openjdk12-find-compiler-fix-env-respect.patch
>   create mode 100644 recipes-core/openjdk/patches-openjdk-12/remove-shell-variables-from-autoheader.patch
>   create mode 100644 recipes-images/images/openjdk-12-test-image.bb
>   create mode 100644 recipes-images/images/openjre-12-test-image.bb
> 
> diff --git a/lib/oeqa/files/hello.java b/lib/oeqa/files/hello.java
> new file mode 100644
> index 0000000..b750670
> --- /dev/null
> +++ b/lib/oeqa/files/hello.java
> @@ -0,0 +1,5 @@
> +class hello {
> +    public static void main(String args[]){
> +        System.out.println("Hello Java here!");
> +    }
> +}

We have already a test.java, is there a reason for a new "hello.java"?

> diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
> index c1e1498..0cce507 100644
> --- a/lib/oeqa/runtime/cases/java.py
> +++ b/lib/oeqa/runtime/cases/java.py
> @@ -81,3 +81,19 @@ class JavaTest(OERuntimeTestCase):
>   
>           msg = 'Incorrect mode: %s' % output
>           self.assertIn(', compiled mode)', output, msg=msg)
> +
> +    # As OpenJDK-12 doesn't support compiled mode (JIT) for arm yet we skip this
> +    # test for now.
> +    @OEHasPackage(["openjre-12", "openjdk-12"])
> +    @OETestDepends(['java.JavaTest.test_java_exists'])
> +    @skipIfInDataVar('TUNE_FEATURES', 'armv4', 'OpenJDK 12 compiled mode not yet supported for armv4')
> +    @skipIfInDataVar('TUNE_FEATURES', 'armv5', 'OpenJDK 12 compiled mode not yet supported for armv5')
> +    @skipIfInDataVar('TUNE_FEATURES', 'armv6', 'OpenJDK 12 compiled mode not yet supported for armv6')
> +    def test_java12_jar_comp_mode(self):
> +        status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
> +        msg = 'Exit status was not 0. Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
> +        msg = 'Incorrect mode: %s' % output
> +        self.assertIn(', compiled mode)', output, msg=msg)
> +
> diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
> index 39ae298..06905b4 100644
> --- a/lib/oeqa/runtime/cases/javac.py
> +++ b/lib/oeqa/runtime/cases/javac.py
> @@ -9,13 +9,22 @@ class JavacTest(OERuntimeTestCase):
>       @classmethod
>       def setUpClass(cls):
>           myfilesdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../files/')
> -        src = os.path.join(myfilesdir, 'test.java')
> -        dst = '/tmp/test.java'
> -        cls.tc.target.copyTo(src, dst)
> +        java_src = ['test.java', 'hello.java']
> +        for j in java_src:
> +            src = os.path.join(myfilesdir, j)
> +            dst = '/tmp/%s' % j
> +            cls.tc.target.copyTo(src, dst)
>   
>       @classmethod
>       def tearDownClass(cls):
> -        dst = '/tmp/test.java /tmp/test.class'
> +        java_src = ['test.java', 'hello.java']
> +        dst = []
> +        d = '/tmp'
> +        for j in java_src:
> +            jc = j.replace('.java', '.class')
> +            dst.append(os.path.join(d, j))
> +            dst.append(os.path.join(d, jc))
> +        dst = ' '.join(dst)
>           cls.tc.target.run('rm %s' % dst)
>   
>       @OETestDepends(['java.JavaTest.test_java_exists'])
> @@ -29,3 +38,13 @@ class JavacTest(OERuntimeTestCase):
>           status, output = self.target.run('javac /tmp/test.java')
>           msg = 'Exit status was not 0. Output: %s' % output
>           self.assertEqual(status, 0, msg=msg)
> +
> +    @OETestDepends(['javac.JavacTest.test_javac_works'])
> +    def test_java_runtime(self):
> +        status, output = self.target.run('javac /tmp/hello.java')
> +        msg = 'Exit status was not 0. Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)
> +
> +        status, output = self.target.run('java -cp /tmp hello')
> +        msg = 'Exit status was not 0. Output: %s' % output
> +        self.assertEqual(status, 0, msg=msg)

Furthermore please create a separate patch for the testcases.

...

> +"
> +
> +# Since v6, GCC sets the default C++ standard to C++14 and introduces
> +# dead store elimination by default. OpenJDK 8 is not ready for either
> +# of these changes.

I guess "OpenJDK 8" here is a copy-and-paste error.

> +FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
> +FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"

What about GCC9?

...

regards;Richard.L

