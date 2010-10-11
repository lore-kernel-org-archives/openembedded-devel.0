Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5Gug-0000FC-4k
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:51:30 +0200
Received: by iwn7 with SMTP id 7so2585202iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=f8GXH7W99g3aI5NE6nkanGcHeBBRE1TUMZ/jPiubd4I=;
	b=vppXJVnOhYC1NB/VMOMR4yQiW1b27/+KFo+wKXz8ars/WoD8TndXJjC+UIsKx/PPC6
	dCTDOJEYvqXnoZN+UnOEei6vJzlNovWy+kwthoS4UukcwnYiNx4SC4yLIAiiGP4xUhQm
	NidzPZs3O53wfXYCGgAWjaeF/n2H8+co4FTEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Kv6cATlzGiZKn5jq6s+HRO/TsghnFq1UmniMjVaKXRHCRHmuZ/QngsVF0uE+wSms/5
	+vWgL0A/k0mvs/t1QOKsuYjryOI8oUbcUC1B7T3wwSI3EuEe/Y5fWuU50aD5/ybMEIMH
	dtGUjCpCBeEMg1mehB7RptbrpNW8sxTsgtJis=
MIME-Version: 1.0
Received: by 10.42.1.14 with SMTP id 14mr1813126ice.49.1286797865775; Mon, 11
	Oct 2010 04:51:05 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:51:05 -0700 (PDT)
Date: Mon, 11 Oct 2010 13:51:05 +0200
Message-ID: <AANLkTineQJGDAdjuuHpkKEsYPU1TuvmgE+7k+EoYqtTp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] unpackaged files
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
X-List-Received-Date: Mon, 11 Oct 2010 11:51:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Currently one gets a NOTE if a file is installed but not packaged.
However in larger builds this often gets lost.
Then again a file installed but not packaged is probably an error.

To make things easier trappable and resolvable, I would propose the following:
- an option (in due time to be made mandatory) to turn the NOTE into an error
- a way to indicate that a file is installed but purposedly not
packaged (e.g. I have such a thing in mythtv with a README file)
This could be by creating a pseudo-package (like -unused or -ignore)
which can be used to add files that are explicitly not packaged

How do people feel about this?
(and, if desired, is there someone who can implement this, guess this
is outside my python skills).

Best regards, Frans


