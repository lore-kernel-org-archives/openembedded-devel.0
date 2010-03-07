Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NoG5U-0001gJ-RC
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Mar 2010 14:00:05 +0100
Received: by gxk24 with SMTP id 24so607974gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Mar 2010 04:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=htjyg0Ph6H1bENuNmp2O2DOaFhXhbyDnBrw6TxsXOWI=;
	b=mZjoy5UP/4/fKc6Jz7GZWrE96D4xB3PUthP6CCxlMqR+Wz/fwa3in5MM/Jk8byPj+m
	VWO1h7r2Ib3EgPlvxl8qYLRSkeNxhpcmq+8E7YiQ2u5ZlCtxn6daTT+1Uw7fQeKoEpu5
	EpB+k2n+2mBJmIx8Tn4wJlccTrTN2+/c8z6Tg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=sSWgOiP88Kea/XpTpLVPplUp5Nn5VuNNipgfPYmqwB0HHll3597INI6pml79O6zZh8
	alFMt09f+Q21X8SLr4uHXhjMdHutURzGM6yPUY04fqx7tmDEZ7id0IAs9ywy7hAxl4M1
	dFH+Qqvct0yXYTT40tzIzODtD98Gat61SyLjM=
MIME-Version: 1.0
Received: by 10.101.7.19 with SMTP id k19mr6821746ani.123.1267966629381; Sun, 
	07 Mar 2010 04:57:09 -0800 (PST)
Date: Sun, 7 Mar 2010 13:57:09 +0100
Message-ID: <ac9c93b11003070457i3f57fbcar68f5c7601f1cc9f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] _target suffix
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
X-List-Received-Date: Sun, 07 Mar 2010 13:00:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

It is possible to override settings for e.g. native by adding _native
to a rule or variable.
However, it is not possible to state that a variable or action is only
for the target.

To me it makes sense to have e.g. _target as default suffix so one can e.g. say:
DEPENDS = "x y z"
DEPENDS_target += "t-native"

BBCLASSEXTEND "native"

(the other way would be:
DEPENDS = "x y z t-native "
DEPENDS_virtclass-native = "x y z"

but i think the former is more readable and more error proof.

(btw the above scenario is typically a situation in recipe t which
want to depend on its own native, but the native of course cannot
depend on itself or on -native-native).

Note that although this is probably not too difficult I am not sure
that my pythonese is good enough to add this.
Any suggestion/implementation/whatever is appreciated.

FM


