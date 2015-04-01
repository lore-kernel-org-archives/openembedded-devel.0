Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id DFA91724B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 15:19:18 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so48787474igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=q87sVBW9+Jl5xZ54AvdO273ztB4zlOTM25PBKBZAUsU=;
	b=cwP0M57ORjMZ+qFgthU0T5RjXlMQAiAS2A52H2/CZTTVShO7txJAV7wq54Dl2NGTms
	jj2BtE+m+mLfWq/I/21m0LLcotY7KuVyisWpQy/DM0nzHuLodVIWVvCrd6c99Mv4NVxp
	qpTYVhnEFRUiUyNz0uxsJRi+JTEGvVgfci8p8rceguB3m1ep66fICrpUCYlMuto2gWo+
	tPHZBCrNqHDRqT8G7w0GSIDi6ptwYE9dEi+LhRPWBOHJzBnYbcYsA7Vl39XpKCQDI1Qz
	gCQLfpp3xRhUUWR2nrxPDdNE3Br8zvOzGdIGs28BHFIVsTDl9KPMkiAIs8c0RUB1e9Pj
	irFg==
MIME-Version: 1.0
X-Received: by 10.43.14.199 with SMTP id pr7mr74617425icb.3.1427901559392;
	Wed, 01 Apr 2015 08:19:19 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Wed, 1 Apr 2015 08:19:19 -0700 (PDT)
Date: Wed, 1 Apr 2015 17:19:19 +0200
Message-ID: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Wed, 01 Apr 2015 15:19:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm currently trying to update openjdk-7 to the current icedtea-release.
I'm getting as far as to the compile step which fails during a run of rmic.
In difference to earlier builds, it tries to run the just compiled
rmic java-classes.

The bootstrap jdk6 complains about incompatible class version.
"Exception in thread "main" java.lang.UnsupportedClassVersionError:
sun/rmi/rmic/Main : Unsupported major.minor version 51.0"

That is correct as the build process compiles these classes with
"-source 7" and "-target 7".
Currently I don't really know how to fix this problem. Atm I guess I
would need to add a jdk6 bootstrap version of rmic. Can anyone give me
a hint how to fix this problem?

If someone wants to have a look at my work and try themselves, I've
quickly posted it to github:
https://github.com/esven/meta-java/tree/jdk_update/

(Just the last one dirty commit)

Cheers,
Sven

