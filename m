Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 084D0751F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 08:04:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,242,1526335200"; d="scan'208";a="10915574"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20180425150646.9032-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <a10420c2-6d8e-9f4d-45ec-067c636bbe37@skidata.com>
Date: Tue, 19 Jun 2018 10:04:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180425150646.9032-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] docs: add bootstrap-flow.txt
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
X-List-Received-Date: Tue, 19 Jun 2018 08:04:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 25.04.2018 17:06, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> Summarises the bootstrap of the java envrionment, rather than having
> to find this described in some wiki page that was copied over from
> OE-classic and never updated.
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>   docs/bootstrap-flow.txt | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>   create mode 100644 docs/bootstrap-flow.txt
> 
> diff --git a/docs/bootstrap-flow.txt b/docs/bootstrap-flow.txt
> new file mode 100644
> index 0000000..602eab7
> --- /dev/null
> +++ b/docs/bootstrap-flow.txt
> @@ -0,0 +1,37 @@
> +* first jikes-native is compiled
> +  * a Java 1.4-capable compiler that does not need a runtime or
> +    (strictly) a class library to work
> +* jikes-initial-native is a wrapper around it
> +
> +* with this compiler we compile the initial (preliminary)
> +  runtime (package virtual/java-initial-native)
> +  * virtual/java-initial-native can be: cacao-initial-native (0.98)
> +    or jamvm-initial-native (1.4.5)
> +    * cacao is preferred, as it has a JIT, but doesn't compile
> +      on all hosts
> +    * cacao-initial-native and jamvm-initial-native both need
> +      classpath-initial-native (0.93) and jikes-initial-native
> +
> +* now libecj-bootstrap-native is built
> +  * this needs jikes-initial-native virtual/java-initial-native
> +* now ecj-initial is built
> +  * this needs libecj-bootstrap-native and
> +    virtual/java-initial-native during runtime
> +  * at that point we have a 1.5-capable compiler (ecj-initial)
> +    running on a Java 1.4 compatible VM (cacao-inital-native
> +    or jamvm-initial-native)
> +
> +* with this compiler (ecj-initial), we compile the final runtime
> +  and compiler (virtual/java-native and virtual/javac-native)
> +  * virtual/java-native can be: cacao-native (1.6.1) or
> +    jamvm-native (2.0.0~pre)
> +    * cacao vs jamvm as above
> +    * cacao-native and jamvm-native both need
> +      classpath-initial-native (0.93) and classpath-native (0.99)
> +      and ecj-initial-native and virtual/java-initial-native
> +  * virtual/javac-native can be: ecj-bootstrap-native
> +    * ecj-bootstrap-native needs libecj-bootstrap-native
> +      and virtual/java-native
> +  * at that point we have a 1.5-capable compiler (ecj-bootstrap-native)
> +    running on a Java 1.5 compatible VN (cacao-native or
> +    jamvm-native)
> 

