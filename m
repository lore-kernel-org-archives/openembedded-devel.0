Return-Path: <prvs=2054d270f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id F124D7F9F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 14:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1572964148; x=1604500148;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=h+8iLBqKP8BKKve5tQxFs5RvhcWBWrgDIw/Plo0ISCg=;
	b=Cse6HVBU0I+uFHWzDcyx8wrf8pJHAb+11RJQA9zvtYjF4HWMuOzD0Je4
	i/lEbRPKmWT+PNKDmHHo5OMvwRcFmwMZyWQq4EZQCRhYJh6FEzdh0kY6g
	RgjXZAIp5uK7WWhy8ooA6OzsRAN9KcEGjP5xAVfu7uTmmWn+bLfdOxc4g
	PVkoOLELW4WK7bhZI4v+u6dBZhYmFxUtz+7jPy5C4QpXjOAKKllRY/ElQ
	VbIbxeFAJiXyR+P3KgEt2GRm4teHTMPYPlh7Gj58YP7X2pkaU0C5qKcdc
	36Y/RCF3STw0gf81qnsLt9YnGd3RbVVEqr9JThoqy+MAz7+x6TJ0IjRsI A==;
IronPort-SDR: 6FGpoIh/Bts9jK7/WXNP4D6MVc8zRVYpQQvKMu3D0Mbeu4vYzzPVx3onVVdl9sAftCQDpGbo7Y
	qrPgUDqUX0LRz1mFqzEP1BFKqMLOVx8H5tO83sc7fj5z1mc9EzE0jfTJbaICZSPQXrRIfFGI5v
	ldz4V3lG2eEnw9umzT8CUEnV5tPYKHjEjJ8v58twxIg814QVH/s2V2+WLC952tkdB149KrJ08o
	lQaRiKmj7YiYQTpXYwME5rPt7gHO929JbxyYS+Syz7Xa/Xw5RAsMrIHSb7EyMPhRsgLoHb1q4S
	JbQ=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; d="scan'208";a="20704474"
To: <openembedded-devel@lists.openembedded.org>
References: <1570069669-31226-1-git-send-email-chris.laplante@agilent.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <48182724-972e-82e2-eb26-a4a839eb19c6@skidata.com>
Date: Tue, 5 Nov 2019 15:29:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1570069669-31226-1-git-send-email-chris.laplante@agilent.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] classpath-native: add patches to fix BigDecimal.compareTo() and BigDecimal.stripTrailingZeros()
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
X-List-Received-Date: Tue, 05 Nov 2019 14:29:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Chris,
thanks for the patch!

Nonetheless I have some nit-picking to do:

a) Please add a "Signed-off-by" line to your patch.

b) Please cut down the title to be less than 80 chars and
    add a more detailed description in the commit message.

If you have any question just drop me a line!

regards;Richard.L

On 03/10/2019 04:27, Chris Laplante via Openembedded-devel wrote:
> ---
>   ...implementation-of-compareTo-in-BigDecimal.patch | 68 ++++++++++++++++++++++
>   ...ecimal.stripTrailingZeros-s-handling-of-0.patch | 51 ++++++++++++++++
>   recipes-core/classpath/classpath-native_0.99.bb    | 12 ++--
>   3 files changed, 126 insertions(+), 5 deletions(-)
>   create mode 100644 recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
>   create mode 100644 recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch
> 
> diff --git a/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch b/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
> new file mode 100644
> index 0000000..35fb81e
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-0.99/0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch
> @@ -0,0 +1,68 @@
> +From b561cdb6f3fef251696216775c775f84369278cc Mon Sep 17 00:00:00 2001
> +From: Chris Laplante <chris.laplante@agilent.com>
> +Date: Wed, 2 Oct 2019 21:38:11 -0400
> +Subject: [PATCH 1/2] Fix bad implementation of compareTo in BigDecimal
> +
> +Prior to this patch compareTo couldn't handle operands with negative
> +scales. It passes the following unit test from JDK8:
> +http://hg.openjdk.java.net/jdk8/jdk8/jdk/file/tip/test/java/math/BigDecimal/CompareToTests.java
> +
> +Upstream-Status: Inappropriate [dead project]
> +
> +Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> +---
> + java/math/BigDecimal.java | 32 ++++++++++++++++++--------------
> + 1 file changed, 18 insertions(+), 14 deletions(-)
> +
> +diff --git a/java/math/BigDecimal.java b/java/math/BigDecimal.java
> +index 7f4546c..e14d894 100644
> +--- a/java/math/BigDecimal.java
> ++++ b/java/math/BigDecimal.java
> +@@ -861,26 +861,30 @@ public class BigDecimal extends Number implements Comparable<BigDecimal>
> +     if (scale == val.scale)
> +       return intVal.compareTo (val.intVal);
> +
> +-    BigInteger thisParts[] =
> +-      intVal.divideAndRemainder (BigInteger.TEN.pow (scale));
> +-    BigInteger valParts[] =
> +-      val.intVal.divideAndRemainder (BigInteger.TEN.pow (val.scale));
> ++    BigInteger[] thisParts = new BigInteger[2];
> ++    BigInteger[] valParts = new BigInteger[2];
> ++
> ++    if (scale > 0)
> ++      thisParts = intVal.divideAndRemainder (BigInteger.TEN.pow (scale));
> ++    else
> ++      {
> ++        thisParts[0] = intVal.multiply (BigInteger.TEN.pow (-scale));
> ++        thisParts[1] = BigInteger.ZERO;
> ++      }
> ++
> ++    if (val.scale > 0)
> ++      valParts = val.intVal.divideAndRemainder (BigInteger.TEN.pow (val.scale));
> ++    else
> ++      {
> ++        valParts[0] = val.intVal.multiply (BigInteger.TEN.pow (-val.scale));
> ++        valParts[1] = BigInteger.ZERO;
> ++      }
> +
> +     int compare;
> +     if ((compare = thisParts[0].compareTo (valParts[0])) != 0)
> +       return compare;
> +
> +     // quotients are the same, so compare remainders
> +-
> +-    // Add some trailing zeros to the remainder with the smallest scale
> +-    if (scale < val.scale)
> +-      thisParts[1] = thisParts[1].multiply
> +-                        (BigInteger.valueOf (10).pow (val.scale - scale));
> +-    else if (scale > val.scale)
> +-      valParts[1] = valParts[1].multiply
> +-                        (BigInteger.valueOf (10).pow (scale - val.scale));
> +-
> +-    // and compare them
> +     return thisParts[1].compareTo (valParts[1]);
> +   }
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch b/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch
> new file mode 100644
> index 0000000..645b010
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-0.99/0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch
> @@ -0,0 +1,51 @@
> +From 14fa6fc320eb84d0adb9ae00dd66ddb1caaae2a6 Mon Sep 17 00:00:00 2001
> +From: Chris Laplante <chris.laplante@agilent.com>
> +Date: Wed, 2 Oct 2019 21:46:01 -0400
> +Subject: [PATCH 2/2] Fix BigDecimal.stripTrailingZeros()'s handling of 0.
> +
> +Previously, 'new BigDecimal("0").stripTrailingZeros()' would blow up:
> +
> +Caused by: java.lang.StringIndexOutOfBoundsException: String index out of range: -1
> +   at java.lang.String.charAt
> +   at java.math.BigDecimal.stripTrailingZeros
> +
> +Fixes https://sourceforge.net/p/saxon/mailman/message/27204592/
> +
> +Upstream-Status: Inappropriate [dead project]
> +
> +Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> +---
> + java/math/BigDecimal.java | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/java/math/BigDecimal.java b/java/math/BigDecimal.java
> +index e14d894..5e30f1c 100644
> +--- a/java/math/BigDecimal.java
> ++++ b/java/math/BigDecimal.java
> +@@ -1335,17 +1335,22 @@ public class BigDecimal extends Number implements Comparable<BigDecimal>
> +    */
> +   public BigDecimal stripTrailingZeros()
> +   {
> ++    if (intVal.intValue() == 0)
> ++      return ZERO;
> ++
> +     String intValStr = intVal.toString();
> +     int newScale = scale;
> +     int pointer = intValStr.length() - 1;
> ++
> +     // This loop adjusts pointer which will be used to give us the substring
> +     // of intValStr to use in our new BigDecimal, and also accordingly
> +     // adjusts the scale of our new BigDecimal.
> +-    while (intValStr.charAt(pointer) == '0')
> ++    while (pointer >= 0 && intValStr.charAt(pointer) == '0')
> +       {
> +         pointer --;
> +         newScale --;
> +       }
> ++
> +     // Create a new BigDecimal with the appropriate substring and then
> +     // set its scale.
> +     BigDecimal result = new BigDecimal(intValStr.substring(0, pointer + 1));
> +--
> +2.7.4
> +
> diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
> index a1e1e0f..daf7611 100644
> --- a/recipes-core/classpath/classpath-native_0.99.bb
> +++ b/recipes-core/classpath/classpath-native_0.99.bb
> @@ -5,11 +5,13 @@ DEPENDS += "classpath-initial-native ecj-initial-native virtual/java-initial-nat
>   PR = "${INC_PR}.0"
>   
>   SRC_URI += " \
> -            file://sun-security-getproperty.patch;striplevel=0 \
> -            file://ecj_java_dir.patch \
> -            file://autotools.patch \
> -            file://miscompilation.patch \
> -            file://toolwrapper-exithook.patch \
> +           file://sun-security-getproperty.patch;striplevel=0 \
> +           file://ecj_java_dir.patch \
> +           file://autotools.patch \
> +           file://miscompilation.patch \
> +           file://toolwrapper-exithook.patch \
> +           file://0001-Fix-bad-implementation-of-compareTo-in-BigDecimal.patch \
> +           file://0002-Fix-BigDecimal.stripTrailingZeros-s-handling-of-0.patch \
>              "
>   SRC_URI[md5sum] = "0ae1571249172acd82488724a3b8acb4"
>   SRC_URI[sha256sum] = "f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8"
> 

