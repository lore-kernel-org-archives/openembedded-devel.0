Return-Path: <dean@ripperd.com>
X-Greylist: delayed 489 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 Nov 2016 03:03:58 UTC
Received: from resqmta-po-06v.sys.comcast.net (resqmta-po-06v.sys.comcast.net
	[96.114.154.165])
	by mail.openembedded.org (Postfix) with ESMTP id AB49665C8F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Nov 2016 03:03:58 +0000 (UTC)
Received: from resomta-po-12v.sys.comcast.net ([96.114.154.236])
	by resqmta-po-06v.sys.comcast.net with SMTP
	id 3wZDche5ljWBp3wZjc1yZO; Tue, 08 Nov 2016 02:55:51 +0000
Received: from mail.ripperd.com ([IPv6:2601:440:c200:21fc:7271:bcff:fe0e:319f])
	by resomta-po-12v.sys.comcast.net with SMTP
	id 3wZhcbYEgtiBA3wZicgUCc; Tue, 08 Nov 2016 02:55:51 +0000
Received: by mail.ripperd.com (Postfix, from userid 65534)
	id 71511663B9; Mon,  7 Nov 2016 20:55:49 -0600 (CST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on apollo.ripperd.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=disabled version=3.4.0
Received: from [10.0.1.6] (unknown [10.0.1.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.ripperd.com (Postfix) with ESMTPSA id 13F7C6638E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 20:55:48 -0600 (CST)
To: openembedded-devel@lists.openembedded.org
From: Dean <dean@ripperd.com>
Message-ID: <bd6b1167-2fc3-fe4f-acfe-d64f0d08e3b9@ripperd.com>
Date: Mon, 7 Nov 2016 20:55:47 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAsKzS81LvV/UNqxVhME5Kvp9WI/XnpgE4t35tImbaLzvYocyqiajbj3IQ12mFYqYRJoMfUVUyaEqR9skW7g7DzmDxRyt+4NgRwQlDw6VSLjkPffMnJ4
	7SB0lOz+pDYtMlfeyT0JMfJhTPWDFDQ4l96udeEEdaKfmi88qpMDgSKYlfNsRxruSyG9ObhCjM6n4A==
Subject: [meta-java] openjre-8 arm JIT jvm
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
X-List-Received-Date: Tue, 08 Nov 2016 03:03:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone have this working? The default recipe for ARM architecture 
only builds a zero jvm that runs in interpreted mode. Naturally this is 
very slow on a slowish ARM processor. I have an application that makes 
heavy use of Java and need to upgrade from OpenJDK 7 to 8 as we are 
having some trouble with PKCS11/JCE in OpenJDK 7.

I did see that Jens had committed OpenJRE-8 with an option to enable 
shark and JIT via LLVM but when asked Jens indicated it was abandoned. I 
got it building but it crashes on startup.

Anyone else doing this and have any leads, pointers, or recipes for 
OpenJDK 8?

Thanks,

Dean


