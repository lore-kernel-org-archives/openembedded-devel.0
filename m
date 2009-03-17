Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1LjcVz-0005DF-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 17:53:16 +0100
Received: by bwz19 with SMTP id 19so245639bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0pmDfu5IPueMjUeE5aCO6UBrQi86EedWgdWJvCHdy/E=;
	b=EG3faUwcsPId0E5giRGnaWLc1fKKx634SRsKzeQDgsl0E2mDeng2BuN1XAKW/Sgp5Y
	V1Z/epA2AI8VcsPfebL/SNBOGHt2aShlMHXBVhmYcYCoZoxRiw29MGZQ+1s6krS96QHp
	TVREzMSVHIW50bi8gNWXZbRXV7TOJHE2B3/rw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iZeptsoZD461+wcO7tFqZAQ0BZcm5+Uf+XH32AYNjoXNOZRUWWy/H/T/WTsiw6w8Fg
	KSrFz5kJmpwocQwsFbZ79OHAD7HD2+uRZIFL1CdA48VdlPz1I/0oyyjzhzrr6xW71sdd
	AJESTfry7jPPXM9uStUBq1SxGXFNz3Evlwoio=
MIME-Version: 1.0
Received: by 10.223.111.134 with SMTP id s6mr213200fap.37.1237308656067; Tue, 
	17 Mar 2009 09:50:56 -0700 (PDT)
In-Reply-To: <200903171412.20971.torsten.sadowski@tu-berlin.de>
References: <200903171412.20971.torsten.sadowski@tu-berlin.de>
Date: Tue, 17 Mar 2009 17:50:56 +0100
Message-ID: <5c5e5c350903170950l79c29249h417c38ad2e38346@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: elena.valhalla@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_20,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Naming of different recipes for the same package
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
X-List-Received-Date: Tue, 17 Mar 2009 16:53:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Tue, Mar 17, 2009 at 2:12 PM, Torsten Sadowski
<torsten.sadowski@tu-berlin.de> wrote:
> I tried to make my own speech-dispatcher package but how can I name it to
> coexist with the default? "speech-dispatcher-noflite_0.6.6.bb" breaks the
> normal ${PN}-${PV} convention and fails during patching:
> Any hints?

you can set the S variable in the recipe like this

S = "${WORKDIR}/name-of-package-dir"

instead of the default value of S = "${WORKDIR}/${PN}-${PV}"

and it will look there for the unpackaged source

-- 
Elena ``of Valhalla''

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


