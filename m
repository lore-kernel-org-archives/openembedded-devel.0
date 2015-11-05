Return-Path: <prvs=744399394=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 660B676E70
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:01:43 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqkEAEBgO1asEApK/2dsb2JhbABehQO/b4M+glQCgXoBAQEBAQGBC4Q1AQEBAwF4EQsNCwkWDwkDAgECAUUGDQgCiCINwgABAQEHAiGGVIR+hSeEEgWWSJY+F5MQhGiFCYEHAQEB
X-IPAS-Result: AqkEAEBgO1asEApK/2dsb2JhbABehQO/b4M+glQCgXoBAQEBAQGBC4Q1AQEBAwF4EQsNCwkWDwkDAgECAUUGDQgCiCINwgABAQEHAiGGVIR+hSeEEgWWSJY+F5MQhGiFCYEHAQEB
Message-ID: <563B6104.4000802@skidata.com>
Date: Thu, 5 Nov 2015 15:00:36 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <563B5C7B.6090204@mlbassoc.com> <563B5CE1.4060808@skidata.com>
	<563B5F8C.1080304@mlbassoc.com>
In-Reply-To: <563B5F8C.1080304@mlbassoc.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java] where is javac on the target
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
X-List-Received-Date: Thu, 05 Nov 2015 14:01:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/05/2015 02:54 PM, Gary Thomas wrote:
> On 2015-11-05 06:42, Richard Leitner wrote:
>> Hi,
>> it should be included in the openjdk-7-jdk package.
> 
> Thanks, that helped.  Perhaps that package should be included in
> the java-test-image?

Good idea ;-)
Do you want to send a patch for that? Or should I do it?

> 
> I now have the compiler on my unit, but I'm still having issues
> trying to run the examples.  Here's what I tried:
> 
> # cd /usr/share/classpath/examples/gnu/classpath/examples/awt
> # javac Demo.java
> Demo.java:1160: error: cannot find symbol
>     AnimationApplet a;
>     ^
>   symbol:   class AnimationApplet
>   location: class AnimationWindow
> Demo.java:1176: error: cannot find symbol
>       a = new AnimationApplet();
>               ^
>   symbol:   class AnimationApplet
>   location: class AnimationWindow
> # ls -l
> -rw-r--r-- 1 root root 33395 Nov  4 13:16 AicasGraphicsBenchmark.java
> -rw-r--r-- 1 root root  6713 Nov  4 13:16 AnimationApplet.java
> -rw-r--r-- 1 root root 29728 Nov  4 13:16 Demo.java
> -rw-r--r-- 1 root root 12595 Nov  4 13:16 HintingDemo.java
> 
> Any hints on how I move forward?
> 
> Note: I'm not experienced with java, just trying to set this up for
> someone else :-)

Sorry, I haven't done anything with the examples (yet). Maybe somebody
else can help?

kind regards,
Richard L

