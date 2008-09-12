Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeHeL-00011e-NN
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 01:02:01 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1313159rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2008 15:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=kdMstPvVPaHPmZLM9he3StwXICeu1ONzSteNDblrvt0=;
	b=acC21TdIz53RKZm8lNgtrpC7MUZeTHV5W6N8htpF/Lz/kDV0MD1C4kFCWNynAh8zHc
	cbUHG/NiNGzMGfNryuPkvCRDRlCg2InJfLTrY4QLVVW8BJSXK3vOJLI0f0ZmNewxnu8u
	/CMXJvPz3n1hKz4dGnRSYILrWrCe4b24GdNZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=jI4TxsRXlRVOlraY6EZ4E+mL/diElMLhrn3yU1xblvfzkmC7ByFhd2g42+EeCJYDKz
	D7bFCK7hqGw5JSVfKutjM0NMFvQWWCCTkWu+62yZfMQB1jb41NgirE1C/XebEBe3PWaB
	eEuOuPK+Fq+4IilscR8wSyADq8t8exPXXNDlU=
Received: by 10.141.88.3 with SMTP id q3mr2979983rvl.3.1221260354427;
	Fri, 12 Sep 2008 15:59:14 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Fri, 12 Sep 2008 15:59:14 -0700 (PDT)
Message-ID: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
Date: Sat, 13 Sep 2008 01:59:14 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: git@vger.kernel.org, monotone-devel@nongnu.org, devel@pidgin.im, 
	openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [ANN] mtn2git v0.1
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
X-List-Received-Date: Fri, 12 Sep 2008 23:02:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

This is the result of various experiments I've been doing while trying
to import mtn repositories into git. I've looked into other mtn2git
scripts but none fitted my needs.

After some rfcs on git and monotone mailing lists it seems now the
script is going in the right direction.

There are two modes:

== checkout ==

In this mode each revision is checked out and imported directly into
git. This means it's 100% sure that the result would be an exact
clone.

The disadvantage is that it's extremely slow (1 day for 25,000 commits).

== fast-import ==

This mode requires a few patches for git fast-import, it's very fast
(40 min for 25,000 commits), but not 100% reliable yet.

There are also some missing features like branch creation and updates.


My plan is to keep these two modes in the code until fast-import
method is reliable enough.

I've tried this with Pidgin's repository. The result is here:
http://github.com/felipec/pidgin-clone

It would be interesting to do something similar with OE's repo. Any takers?

Comments and patches are welcome :)

-- 
Felipe Contreras


