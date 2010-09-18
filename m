Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ox2UP-0004FB-IM
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 20:50:22 +0200
Received: by iwn2 with SMTP id 2so2993055iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=0ivUtfsrC+SlT5YKniRDpucuo7JvTfYhEOgbKz+UFkQ=;
	b=m9ud3T0ar1tXhudsBVK/sBXQdsmFptXUM3CgafkjbQxDrVLXY1PYkKMGe9DZYG1Syi
	SAAGFAe8ppJrUrMZJTRE2g5OiRvATx+f8H+Zn2R8qW/sDGggXIeu1aQ/c/TCGKB0LMeL
	rZkLwwOoXDLx0f+hU1YPz8k8PWwOX2nYzRuaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=IXv4mJ+0ReLj3rgqxgnBXWsaq8IotnNAjBM6qA43X3W+5DU6kH3YTEIA3AM5UTocSU
	H7O3jI6sJtHGt1KMPtLVbaVp4udgIvv2d73s3lbIA1DfZidphyeodRFgbkyzRI7Lnwwt
	kbl75HLGOSKktrfhI3WOktIl0yf+arqiteYK8=
MIME-Version: 1.0
Received: by 10.231.33.205 with SMTP id i13mr7405270ibd.59.1284835766278; Sat,
	18 Sep 2010 11:49:26 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Sat, 18 Sep 2010 11:49:26 -0700 (PDT)
Date: Sat, 18 Sep 2010 20:49:26 +0200
Message-ID: <AANLkTinhwNWjTY4wv_dZ0Ju5vHwxNU918Ba9Sg3FOyZu@mail.gmail.com>
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
Subject: python-tlslite
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
X-List-Received-Date: Sat, 18 Sep 2010 18:50:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

python-tlslite does not fetch any more.
When fetched a html page is returned saying <h3>Error: Page cannot be
displayed. Please contact service provider for more details. (3)</h3>

And the url http://trevp.net/tlslite gives a generic page like you get
with some of those domain resellers.

python-tlslite is defined in

python/python-tlslite_0.3.8.bb:HOMEPAGE = "http://trevp.net/tlslite/"
python/python-tlslite_0.3.8.bb:SRCNAME = "tlslite"

and used in:

tasks/task-mamona-python.bb:    python-tlslite \
tasks/task-python-everything.bb:  python-tlslite \
tasks/task-python-sharprom_20060425.bb:		python-tlslite		\

suggestion: move the recipe to nonworking and take it out of the tasks.

Frans.


