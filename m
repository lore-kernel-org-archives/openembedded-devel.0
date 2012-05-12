Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1STEAV-0002kO-E8
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 May 2012 17:23:39 +0200
Received: by qady23 with SMTP id y23so2771106qad.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2012 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=2LnIRdS3QXIjzVWFa36HjdcHBqyYfkM3ad8nzpl8A6g=;
	b=Vy8vVwunKhnejWqVPJm63VbE/uHVS+ukkybJd+BPOym+dv7ZJOAC89FGdVf7VBrOfn
	c9IDjTYfxq1Hit43LtfhR4w1P1tlVvjE2Es/7s0OXdoySZOvI+dZuKNaxYCf7+QyaUpi
	HjxfpRzLza4oxYPuH98PLmIYcXHtN8AtsSr6LLU7PoM9xFsZORsweYQKQWtbF8Vc5zYb
	u7YFnXFzQ9zvonkphbro+YUiSUaP/TL+hh5prC2ydJzSr4IyPryBEZJMUnTmE2twsnrG
	ZCsbEi/bpTDMCboshCvX9RfRbzx9qHn9qs0QELO5I5QdlvCWnXWWV4MUPcJLGd3yDTKx
	+qGA==
MIME-Version: 1.0
Received: by 10.224.72.131 with SMTP id m3mr3028935qaj.82.1336835622339; Sat,
	12 May 2012 08:13:42 -0700 (PDT)
Received: by 10.229.217.200 with HTTP; Sat, 12 May 2012 08:13:42 -0700 (PDT)
Date: Sat, 12 May 2012 17:13:42 +0200
Message-ID: <CAC+thW2MuHaF_TG-zC1ed=k+LMtieowigBVh_cefdW90eEEpXQ@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: meta-java: adding support for gradle build tool and gradle based recipes
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
X-List-Received-Date: Sat, 12 May 2012 15:23:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'd like to estimate the feasibility of bringing some java libraries
and tools to the embedded platforms that I manage with variants of
oe/yocto stacks.
I looked around and noticed a meta-java layer is available: I hope
this is the right place to ask about it, since I found no
layer-specific list. If I'm off topic here, please suggest more
suitable pointers.

Said java libs and tools require gradle [1] to build. My guess is that
a native recipe for gradle will be needed first. This appear to be a
"ant-like" problem, since gradle is said to be using gradle itself to
build.
I had a look at it's build documentation and source code. There is a
shell script setting up suitable parameters for JVM, then downloading
a wrapper class which builds the tool from sources.

Before going for experimentations...
1. Did anybody already try to set up a recipe for gradle?
2. What are the expected challenges I'm supposed to meet in setting up
a native java based recipe leveraging meta-java? Is there any
particular limitation in current native environment used i.e for
building ant?
3. Could it be a reasonable approach to temporarily use a host build
of gradle as a jump start for building final libs and tools? If so,
what will be the required setup to instruct other recipes for using
the host version of gradle. I know this is evil, but I expect more
trouble in building gradle than gradle based recipes. Of course, this
might be a completely wrong perception! ;-)

Hope the java masters will forgive me if my questions sound silly. I'm
not a "building-for-java" expert at all: I hope this could be an
opportunity to learn something new!

[1] http://www.gradle.org

Regards,
Andrea


