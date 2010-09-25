Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzYsD-0003Ct-Np
	for Openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 19:49:23 +0200
Received: by iwn2 with SMTP id 2so1562431iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=nQC54DZPubUYli10qv+fxvTZ6P+iszjR/34prHRdHt8=;
	b=TIAtWUgFinQ5CILeVyFJ/UtAX3WyjuXOwQCTu5EmNYbvgo0qskjryQuOd5qcq+pkpc
	TMgpyygR8Ml55msJ2pjsJUGpTSCLShOJYILi8ATHvPdgjU8rffLea3FnlTzUFOxaquc8
	YN2uWBo972SNX6pLcexRBxwnabTHR0xlC/BWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=igRBbldlGEktebTuZgBXXRD76AjyFmX9DfKW7WfUeJjFjykmepUkNKFEj3d46xTF1Z
	ANZ35RgA1WnYrAiwgrlK8IN75uO7hd3+9JwTmSzYrmi83wn2havYTt74LHtIIpDFEHKR
	4EmPkiTvVlgAZBeRfgSS/ODbjrXuVVfUE0GSY=
Received: by 10.231.149.207 with SMTP id u15mr6050692ibv.13.1285436954735;
	Sat, 25 Sep 2010 10:49:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 25 Sep 2010 10:48:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Sep 2010 10:48:54 -0700
Message-ID: <AANLkTi=yzQKfFvBDGM2JtTGoz+Zq40M0VcaZVYOxcaWy@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc 4.5 - linaro into OE
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
X-List-Received-Date: Sat, 25 Sep 2010 17:49:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have ported some patches from linaro into OE gcc 4.5, they work fine
and the tests results look good
it should improve the performance too. It would be nice if somebody
could try this out and report any
issues. Results of my gcc testsuite run are here

http://uclibc.org/~kraj/gcc-results/

I will post any performance results if I do

The git branch is khem/import-linaro-gcc-4.5

Thanks

-Khem


