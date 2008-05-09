Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JuWJx-00051B-0o
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 May 2008 19:23:49 +0200
Received: by an-out-0708.google.com with SMTP id b38so276929ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2008 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=NsTJH47hSRGO1tTqp0HtPQKFWoAyk6o+yAwbnWPjvlg=;
	b=f8QIddyxt8eySiCApwGNCoOx4R3R8M+PbJvUO7ngQGo7PA0bRhFu9SGGKdfLy8SLgF0XbhRxgehn/KPakDgp6H7BAB/cMzBka4WoTbpPivdmUEE6KEavblN4mgnMD1qGraRicHd2/3dIE30JaTUGrqIiIbB1jY7ntxEuMCf3fak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=Bdmlc1hYiG4vcnffTsIzC6E7H21O/KMRnhslXMCgN1ofz6qQCxcij+69E8LptTH5XoTN7lXnSeaS8DsyrYgsnh82VbFJ+4/E978ANjn1BcnCRTfD2HxPdSioBXaEUYn93SBOLS4v5lTaIAufqptmftA4m0nbV30USiPRyxaEeBs=
Received: by 10.100.5.16 with SMTP id 16mr6093912ane.102.1210353777475;
	Fri, 09 May 2008 10:22:57 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 9 May 2008 10:22:57 -0700 (PDT)
Message-ID: <c384c5ea0805091022g4c7cf05cxad9239ea6d9c72d1@mail.gmail.com>
Date: Fri, 9 May 2008 19:22:57 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g01vo9$fb9$1@ger.gmane.org>
MIME-Version: 1.0
References: <48246A67.4030800@balister.org> <g01vo9$fb9$1@ger.gmane.org>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: Change ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 09 May 2008 17:23:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, May 9, 2008 at 6:56 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Philip Balister wrote:
>>
>> I'd like to change the variable used for the user to add packages to a
>> standard image from ANGSTROM_EXTRA_INSTALL to IMAGE_EXTRA_INSTALL. This
>> is an image property, and not Angstrom specific.
>>
>> Is there anything wrong with this idea?
>
> Yes, since it is intended to put angstrom specific stuff inside the image.
>
Philip proposes to change its naming so that it is intended to put
distro specific stuff inside the image.

Angstrom being a distro, this is the neatest solution for both
OpenEmbedded and Angstrom.

> It is there because it got fed up receiving hate-mail everytime I edited an
> image recipe. Since we seem to have a couple of resident angstrom-haters
> nowadays, I vote for leaving it as-is.
>
The feature of putting some distro dependent stuff in the image
remains, so renaming this should not increase the amount of hate-mail
for anyone.

+1 from me.

Regards,
-- 
Leon


