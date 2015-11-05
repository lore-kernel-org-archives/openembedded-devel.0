Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3076375D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 13:52:59 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id EC0DAF811DC; Thu,  5 Nov 2015 06:52:59 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9BAADF811D7;
	Thu,  5 Nov 2015 06:52:59 -0700 (MST)
To: openembedded-devel@lists.openembedded.org
References: <563B5C7B.6090204@mlbassoc.com> <563B5CE1.4060808@skidata.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <563B5F8C.1080304@mlbassoc.com>
Date: Thu, 5 Nov 2015 06:54:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <563B5CE1.4060808@skidata.com>
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
X-List-Received-Date: Thu, 05 Nov 2015 13:53:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-11-05 06:42, Richard Leitner wrote:
> Hi,
> it should be included in the openjdk-7-jdk package.

Thanks, that helped.  Perhaps that package should be included in
the java-test-image?

I now have the compiler on my unit, but I'm still having issues
trying to run the examples.  Here's what I tried:

# cd /usr/share/classpath/examples/gnu/classpath/examples/awt
# javac Demo.java
Demo.java:1160: error: cannot find symbol
     AnimationApplet a;
     ^
   symbol:   class AnimationApplet
   location: class AnimationWindow
Demo.java:1176: error: cannot find symbol
       a = new AnimationApplet();
               ^
   symbol:   class AnimationApplet
   location: class AnimationWindow
# ls -l
-rw-r--r-- 1 root root 33395 Nov  4 13:16 AicasGraphicsBenchmark.java
-rw-r--r-- 1 root root  6713 Nov  4 13:16 AnimationApplet.java
-rw-r--r-- 1 root root 29728 Nov  4 13:16 Demo.java
-rw-r--r-- 1 root root 12595 Nov  4 13:16 HintingDemo.java

Any hints on how I move forward?

Note: I'm not experienced with java, just trying to set this up for someone else :-)

> On 11/05/2015 02:41 PM, Gary Thomas wrote:
>> I tried running the java-test-image from this layer and found
>> lots of .java files, but no javac compiler.
>>
>> Looking at the recipe for openjdk-7-jre I can see javac built,
>> but it doesn't seem to be packaged.
>>
>> Am I missing something?  How can I get the java compiler on my
>> target?
>>
>> Thanks
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

