Return-Path: <prvs=282131db8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id E7CA47FCAD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1579606214; x=1611142214;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=F22WpmgCxrxY5RWjhrw2g1dhNL3nIzTu6kT0znVVlBw=;
	b=LxYV7mJgl1Y5J2BHb9XFzqp/NMNTP4OKT9NuuL8AiC/NcIwGS4ZFE3+R
	YyicL+R2c8A0GpRUNZ3WFHB8PP905GfDsIvrUbg697o92W/RNsBUAiG9W
	wy1A6h90qL+POI8+MMOZjN1qCXidn+VK+ffKpfuowAhpLyJJvRmOGWD/9
	YObryxRTJJipIk5SeDPbYro6IPanRpfHDHibAaqy+aukEZRSkqq9/80tZ
	jvB4I7MC3FA8lmQSFvah0THBNr/2LMT9IgH1JGToYe3+tA+0YxikctBpd
	IaCa5x8SIuS2Fo8ffTc5KiBGdbt3Zc1fYbzNd3cBFkqY990cLXV374u/d A==;
IronPort-SDR: jJDHyvHNQ1SXrYCfAyxRDgAvapG1G3DC/0vkNwwZMkBW9kaQ53iRNGnFPfwB/WQF3TQwbe63UI
	CRd3Tz70M7WqcsEDl1qpHql/k8Xy0JjOFRF0NE9IU2SreoB6Uckw05UsuCspFvkJMrtfRlY9/7
	P+/wkBTAV+8avIwrTX5vooZNkARnKoJSot6mZxz45fbK9wUbbiopjm4YXpsOMgHuxD6W0O9ujF
	s8nGW3Ryza1RfjCkRhvIZ0fP4NN3CZ6aYjFhFOIBDERh/D4f3fC7HbkGqAMXx7cnuP2ep9Tn+g
	IpA=
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; d="scan'208";a="22156756"
Date: Tue, 21 Jan 2020 12:30:12 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: <mohamad.noor.alim.hussin@intel.com>
Message-ID: <20200121113012.GB24847@pcleri>
References: <20191231071948.28950-1-mohamad.noor.alim.hussin@intel.com>
	<20191231071948.28950-3-mohamad.noor.alim.hussin@intel.com>
MIME-Version: 1.0
In-Reply-To: <20191231071948.28950-3-mohamad.noor.alim.hussin@intel.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH v3 2/2] openjdk-12: Add test cases for openjdk-12
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
X-List-Received-Date: Tue, 21 Jan 2020 11:30:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Tue, Dec 31, 2019 at 03:19:48PM +0800, mohamad.noor.alim.hussin@intel.com wrote:
> From: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> 
> There are 2 test cases added. Test case number 1 specifically to
> test openjdk-12. The list of test cases as follows
> 
>  1) test_java12_jar_comp_mode
>  2) test_java_runtime
> 
> 1) test_java12_jar_comp_mode
> This test case will execute java code in jar format using jvm compilation mode.
> 
> 2) test_java_runtime
> This test case will compile java code and execute with classpath.
> 
> Signed-off-by: Mohamad Noor Alim Hussin <mohamad.noor.alim.hussin@intel.com>
> ---
>  lib/oeqa/files/hello.java       |  5 +++++
>  lib/oeqa/runtime/cases/java.py  | 15 +++++++++++++++
>  lib/oeqa/runtime/cases/javac.py | 27 +++++++++++++++++++++++----
>  3 files changed, 43 insertions(+), 4 deletions(-)
>  create mode 100644 lib/oeqa/files/hello.java
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

I don't get why you add a new java file which will be compiled for
testing. Can you please explain it to me?
We already have "test.java", why aren't you using this one?

regards;rl

> diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
> index c1e1498..9a73311 100644
> --- a/lib/oeqa/runtime/cases/java.py
> +++ b/lib/oeqa/runtime/cases/java.py
> @@ -81,3 +81,18 @@ class JavaTest(OERuntimeTestCase):
>  
>          msg = 'Incorrect mode: %s' % output
>          self.assertIn(', compiled mode)', output, msg=msg)
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
> diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
> index 39ae298..06905b4 100644
> --- a/lib/oeqa/runtime/cases/javac.py
> +++ b/lib/oeqa/runtime/cases/javac.py
> @@ -9,13 +9,22 @@ class JavacTest(OERuntimeTestCase):
>      @classmethod
>      def setUpClass(cls):
>          myfilesdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../files/')
> -        src = os.path.join(myfilesdir, 'test.java')
> -        dst = '/tmp/test.java'
> -        cls.tc.target.copyTo(src, dst)
> +        java_src = ['test.java', 'hello.java']
> +        for j in java_src:
> +            src = os.path.join(myfilesdir, j)
> +            dst = '/tmp/%s' % j
> +            cls.tc.target.copyTo(src, dst)
>  
>      @classmethod
>      def tearDownClass(cls):
> -        dst = '/tmp/test.java /tmp/test.class'
> +        java_src = ['test.java', 'hello.java']
> +        dst = []
> +        d = '/tmp'
> +        for j in java_src:
> +            jc = j.replace('.java', '.class')
> +            dst.append(os.path.join(d, j))
> +            dst.append(os.path.join(d, jc))
> +        dst = ' '.join(dst)
>          cls.tc.target.run('rm %s' % dst)
>  
>      @OETestDepends(['java.JavaTest.test_java_exists'])
> @@ -29,3 +38,13 @@ class JavacTest(OERuntimeTestCase):
>          status, output = self.target.run('javac /tmp/test.java')
>          msg = 'Exit status was not 0. Output: %s' % output
>          self.assertEqual(status, 0, msg=msg)
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
> -- 
> 2.19.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

