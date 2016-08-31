Return-Path: <prvs=044b5707d=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4B9601B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 06:44:30 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2AtBwDQe8ZX/0oKEKxcg00BAQEBAYEfA1a4PoIBhh0CgggUAQIBAQEBAQEBgQVBEIQQAQEEATIBSwsLDQsuVwYNCAKIOr14AQEIJ4YwgXgIgk2FDIUQBZlQgWSXJxeFZYxIg3kehGuCO4QgfwEBAQ
X-IPAS-Result: A2AtBwDQe8ZX/0oKEKxcg00BAQEBAYEfA1a4PoIBhh0CgggUAQIBAQEBAQEBgQVBEIQQAQEEATIBSwsLDQsuVwYNCAKIOr14AQEIJ4YwgXgIgk2FDIUQBZlQgWSXJxeFZYxIg3kehGuCO4QgfwEBAQ
To: <openembedded-devel@lists.openembedded.org>
References: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <f7484e54-b3c3-7273-c6e9-ef46e908cc23@skidata.com>
Date: Wed, 31 Aug 2016 08:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <9cb3a54e-58ef-9433-06d9-514238fb9443@siemens.com>
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex2srv.skidata.net
	(172.16.10.93)
Subject: Re: [meta-java] Unify virtual java providers
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
X-List-Received-Date: Wed, 31 Aug 2016 06:44:33 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 08/30/2016 04:37 PM, Pascal Bach wrote:
> Hello
> 
> 
> Because I'm experimenting with different java providers (OpenJDK, Oracle Java, Azul Zulu) and thus had a look at different java layers (meta-java, meta-oracle-java).
> 
> I noticed that there are many different PROVIDES statements among these recipes, but nothing seems consistent.
> 
> My proposal is thus to introduce a consistent naming for these provides so that recipes that depend on java can be written in a JRE/JDK independent way.

I totally agree with your proposal.

> The naming would be the following:
> 
> - virtual/java => recipes providing a java runtime for the target (used in meta-oracle-java, replaces: java2-runtime, java2-vm)
> - virtual/java-native => provide a native java runtime (exists already)
> - virtual/javac => provide a jdk for the target (new, nothing like this exists, might never be used but should be defined)
> - virtual/javac-native => provide a jdk for native (exists already)
> 
> It should be properly documented in the readme and the virtual packages should be the preferred way for users to depend on java/jre resp javac/jdk

ACK

> 
> An alternative to the above would be:
> 
> - virtual/jre
> - virtual/jre-native
> - virtual/jdk
> - virtual/jdk-native
> 
> But this would deviate more from the current naming.
> 
> Any feedback on this proposal?

Personally I would prefer the jre/jdk naming. IMHO it seems to be the
prevalent form.

