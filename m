Received: from [209.85.217.224] (helo=mail-gx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mxl2O-00019t-QW
	for openembedded-devel@openembedded.org; Tue, 13 Oct 2009 19:19:55 +0200
Received: by gxk24 with SMTP id 24so171891gxk.6
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Oct 2009 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=Txpfog3sIgauFCq3wkZJ803tmozdCPV0YN5HHsjgRnw=;
	b=Q6weSIfM+gNGjiGwQDXuNVtx9XEctaQfuyvB/4ZI7ryVV4CyzJMFpqyBkp3dENaQZM
	pz47iB7rS8y2eJ4fHDzdmeOCO2x7ipfCxD7Ru6b7k1gXEo7N7Q0YWW0XdmrrcZm2jG4t
	nlZ3gJtY34WT8pwpywGi2/+GTnvkHpmePtJFI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=bL6R8Sn8XdhYR52NJZtfGYoJDJ9jpXLjxPCvFFIN2eY+ZQ4izMx2pp7iMC2o7d/Hsl
	00g3P8UrNZ9cyuroYP2Pijfdv3xA65TnqVzh3XY5jlKOYvJu9JuiZeamXvu8gP+nSTvp
	7MUEYG1F2PVw59HnKlbI6ZWTs38ateO4+ZMxA=
MIME-Version: 1.0
Received: by 10.150.45.35 with SMTP id s35mr8597773ybs.129.1255454337960; Tue, 
	13 Oct 2009 10:18:57 -0700 (PDT)
In-Reply-To: <CF493A793F2E6449A99509ED313552E0022A28071C@HVXMSP6.us.lmco.com>
References: <CF493A793F2E6449A99509ED313552E0022A28071C@HVXMSP6.us.lmco.com>
Date: Tue, 13 Oct 2009 13:18:57 -0400
Message-ID: <f96d234e0910131018p17bee861r1aa3561b4d5978f4@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@openembedded.org>
Subject: Re: How can I download if I don't have git and behind firewall.
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
X-List-Received-Date: Tue, 13 Oct 2009 17:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 13, 2009 at 11:32 AM, Wagener, Brian H
<brian.h.wagener@lmco.com> wrote:
> Is there a way to download openembedded via tar file on http?

You will also run into issues with openembedded downloading a bunch of
stuff during the build.

I would probably set up a virtual box or vmware virtual machine, put
it on a USB HD or laptop and do the build offsite where you have full
internet access, and then bring it back onsite.

Cliff


