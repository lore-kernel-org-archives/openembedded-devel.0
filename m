Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SgqPV-0007BY-MS
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 06:51:25 +0200
Received: by eekd49 with SMTP id d49so1835235eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 21:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HgEuqQNWTCPlN2PUcxoXDAA3I5xDjUvXlhwDCBuUAbA=;
	b=d2TA00efF5vYhvf51z8kHzpcf1F49u+b8ZFnto8vdnHmRG1Xb6+0Wyc45S10AjhpWp
	y3KHuwPdaQ0au326x0smyP28LHG2fs61Yu3p+ccH9/KrTRtZfKP6nSQNgQE1FwlHHeNv
	3v5warQVChLK7qyGyGdDjedHqpxDNvfTOxAVfh59MmADUI60G/Z9YeREQpKSXGkzrZtR
	jQRtSk8fo2wnDfFoFDwi2FBtLXF+shavKOFuWi6iGaIH6KKLLPGYzM+yBF3r/te7R1S3
	dwzfjTyVLyX9dpmFHMS0cYWJ7TIuL/EEMNNwTZAIyPYYH6Bv1aoRm4IaQDdWh7bZUcGy
	si5w==
Received: by 10.14.37.76 with SMTP id x52mr4133052eea.102.1340080842704; Mon,
	18 Jun 2012 21:40:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Mon, 18 Jun 2012 21:40:12 -0700 (PDT)
In-Reply-To: <4FE00142.30908@gmail.com>
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
	<7888297.NxAaM4fFbI@pink> <4FE00142.30908@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2012 21:40:12 -0700
Message-ID: <CAMKF1sr6ekWbucQzJD+uM7ToH2mZfQ9yYVOPbhOKr8uLZjCTrQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package selection
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
X-List-Received-Date: Tue, 19 Jun 2012 04:51:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 18, 2012 at 9:34 PM, j <vwyodapink@gmail.com> wrote:
>>
>> Also, you need to bitbake -c cleanall <your-package> to make bitbake
>> forget it
>
>
> Isnt bitbake -c cleansstate <your-package> a better method of cleaning a
> build you want to do again?
>
> If not does anyone know what the actual difference is?

clean - cleans the builddir
cleansstate - cleans builddir as well as shared state copy of this
package if any
cleanall - clean builddir, shared state and the downloaded src tar
file from DL_DIR

you usually only should need clean in general. cleansstate should be seldom used
but its preferred to see why cleansstate is needed and if there is
anything wrong
with sstate we would like to know.


