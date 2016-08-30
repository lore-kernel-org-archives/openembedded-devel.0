Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 771A5605B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:37:59 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id u7UEbrB0020050
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:37:54 +0200
Received: from [139.16.79.116] (MD1FZU9C.ww002.siemens.net [139.16.79.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id u7UEbrwn009070
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:37:53 +0200
To: openembedded-devel@lists.openembedded.org
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
Date: Tue, 30 Aug 2016 16:37:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Tue, 30 Aug 2016 14:38:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello


Because I'm experimenting with different java providers (OpenJDK, Oracle Java, Azul Zulu) and thus had a look at different java layers (meta-java, meta-oracle-java).

I noticed that there are many different PROVIDES statements among these recipes, but nothing seems consistent.

My proposal is thus to introduce a consistent naming for these provides so that recipes that depend on java can be written in a JRE/JDK independent way.
The naming would be the following:

- virtual/java => recipes providing a java runtime for the target (used in meta-oracle-java, replaces: java2-runtime, java2-vm)
- virtual/java-native => provide a native java runtime (exists already)
- virtual/javac => provide a jdk for the target (new, nothing like this exists, might never be used but should be defined)
- virtual/javac-native => provide a jdk for native (exists already)

It should be properly documented in the readme and the virtual packages should be the preferred way for users to depend on java/jre resp javac/jdk

An alternative to the above would be:

- virtual/jre
- virtual/jre-native
- virtual/jdk
- virtual/jdk-native

But this would deviate more from the current naming.

Any feedback on this proposal?

Pascal


