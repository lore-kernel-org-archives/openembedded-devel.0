Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1RmhcF-00007m-5v
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 09:08:31 +0100
Received: by iabz21 with SMTP id z21so942341iab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 00:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:from:mime-version:date:message-id:subject:to
	:content-type; bh=IURVpufJIcc7XWh4e8ORvw1G6HWeBZYqe9gh2Oca0J0=;
	b=QZAItEuiUxvapII9MXFtEYGcy+/g3z9+OxhIgAebyRQAEPCn/F8hdD7MFeub4KkjDv
	FYsJVW/Q5GoklD4TAt80rULp9DOJ8izaIMHUs7l5/aohDpSBxmzI7Ye521XzfrJqL1Nk
	fudsX9BF3H2+L8S210vxYr4cr/gmKDFq0tHag=
Received: by 10.50.157.131 with SMTP id wm3mr11870651igb.13.1326700854940;
	Mon, 16 Jan 2012 00:00:54 -0800 (PST)
References: <4f13d827.8b7a0e0a.2808.ffffe10eSMTPIN_ADDED@mx.google.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 16 Jan 2012 09:00:52 +0100
Message-ID: <873008982550291386@unknownmsgid>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Python2.7.2 compatibility
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
X-List-Received-Date: Mon, 16 Jan 2012 08:08:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All, I've read the OE-Classic repository will be stopped and alla the
new work will be on OE-Core one. Can you confirm this? If so, I'll have to
move my work on a given layer in this new developing tree. Please let me
know.
Best Regards,
Giuseppe


Inizio messaggio inoltrato:

*Da:* Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
*Data:* 16 gennaio 2012 08:56:20 CET
*A:* <giuseppe.condorelli@gmail.com>
*Oggetto:* *FW: [oe] [OE] Python2.7.2 compatibility*



-----Original Message-----

From: openembedded-devel-bounces@lists.openembedded.org

[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of

Paul Eggleton

Sent: Wednesday, December 28, 2011 6:04 PM

To: Giuseppe Condorelli

Cc: openembedded-devel@lists.openembedded.org

Subject: Re: [oe] [OE] Python2.7.2 compatibility


On Wednesday 28 December 2011 17:57:33 Giuseppe Condorelli wrote:

This is the log error I catch, I can think it is due to python but

maybe

I'm wrong.


---------------------------------

bitbake base-image

ERROR: There is a comment on line 24 of file

/home/condorg/work/openembedded/recipes/ekiga/ekiga_git.bb (#

--enable-static-libs \) which is in the middle of a multiline

expression.

Bitbake used to ignore these but no longer does so, please fix your

metadata as errors are likely as a result of this change.


OK, this has nothing to do with Python version - you're using a new

BitBake

version with the OE classic metadata and the two are not compatible for

the

reason shown in the error - comments are no longer allowed within

multi-line

expressions.


There are three choices:


a) Switch back to an earlier version of BitBake (e.g. 1.12.x)

b) Move up to OE-Core [1]

c) Go through and fix all of these comments


Cheers,

Paul


[1] http://www.openembedded.org/wiki/OpenEmbedded-Core


--


Paul Eggleton

Intel Open Source Technology Centre


_______________________________________________

Openembedded-devel mailing list

Openembedded-devel@lists.openembedded.org

http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

