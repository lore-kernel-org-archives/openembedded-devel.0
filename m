Return-Path: <asselsm@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 61E98787F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 19:35:36 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id z62so6886756yba.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Dec 2017 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=011bhqI22qFU+wLBePBTtM0gA8ovHYEYQzD+F1eJMxE=;
	b=tXYh2Q7Y/GERIqWWsEi8J1oQktBILkzXoI9pGQ8eZkBYjinFJ2h+Yfyltk2pbvrtij
	lCICLRnQmafnq2ZhHVSLJsJPzMHIODOUh8GU/Qme2krMZvcBWVbxgeUdMwedv+yDYYo8
	ADr4H+XDvt/HlzXSq7OWzP3lQODP4KRS83T1mBuynh843uFbpL1ce8hj7hGC3NP4V+z8
	wrzUkpC1jASXSsuVQDMHhu69AMvp1+KBcPl4DNP31TqoCTzUJOYDjugfv4/Y6vJ8cRwG
	pLWvpv43YYfjAvC3Y5nGomeekvsmWZjJcddZg9y129ATtUnIR5vIo0e9BlzzYqGzbLxx
	qfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=011bhqI22qFU+wLBePBTtM0gA8ovHYEYQzD+F1eJMxE=;
	b=obsAlxF/0lXX5o+ZNpP2LecwkvRMVMGs9sOu33y6fsVj/z++wRc/ooUviu+g9/PQ+7
	c9rjwwJcoHDyzTsPIbB4vrzGrJk4BsUfLDCgJ1Rp7N0GtEHkaXC4awJJiVpTjAkmyKFC
	Bk3oKb1k2kUHP1mgPpQTk/mm62FmcqCGkLjwUCDtf0k3ThlN5vphtIqcf84jojgsLNNf
	Vds0GY1WMXYoFCl+g8EBq+hpSLO+61la6TWDzhmuz4znGrVPLboeQS32Jax1OEAqg2LI
	VRLnQs3Jcv+hqsQF0nD85wG4G4GW1gHznOEUTenC8QFIJhvxV2xpfdDBphmAdQhDpJpD
	8yhQ==
X-Gm-Message-State: AKGB3mK4u4rPNnc7wDY9UsVlxHIhZEvfa3RYKTENXQBpYitIc9H0XwqJ
	7Oisnm+3fMjQQi3I7W4Kb9ZLvQUWZY+6PsphZ3Y=
X-Google-Smtp-Source: ACJfBosybiT2kCLA+ME1aAReLRe+PWWOdOnR9KqlTWsk/qSz/a7bQ/4qolr5vENEnyjLaVjrBpD0t5EbPQ9N5TfNh0I=
X-Received: by 10.129.95.2 with SMTP id t2mr1761093ywb.300.1513366537805; Fri,
	15 Dec 2017 11:35:37 -0800 (PST)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 10.37.56.83 with HTTP; Fri, 15 Dec 2017 11:35:37 -0800 (PST)
In-Reply-To: <CADNbA1rAdMXYjbxFOO3=sK9GOiSDiYLeXx0eXgc4K_1Ep30_jg@mail.gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<1513359926-17087-3-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1ruiCp4u810eg9LcLXzWdAAaMY5aC-5KVyeViq4jSKxKg@mail.gmail.com>
	<CAPuovEJCQwFBiFsG5_7miubOgteakgkSzXL5H+3qLYcWqPeo+w@mail.gmail.com>
	<CADNbA1oB3Mmq5B9SNX5OCG8uzmTdTx2kQ8EChZu1_JpntweSNQ@mail.gmail.com>
	<CAPuovEK9x73CjzFPPXYm1iP5Utf=q_4tESK7Krsug79CN+pz=Q@mail.gmail.com>
	<CADNbA1rAdMXYjbxFOO3=sK9GOiSDiYLeXx0eXgc4K_1Ep30_jg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 15 Dec 2017 14:35:37 -0500
X-Google-Sender-Auth: OIIjUBTQaA3n8rnOvQ0BrY25SSo
Message-ID: <CAPuovEKswWyLr5cQCsak4xM88AXgP+1ZyEjthoRGFmRdGyueMg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Fri, 15 Dec 2017 19:35:37 -0000
X-Groupsio-MsgNum: 69975
Content-Type: multipart/mixed; boundary="001a1147e4e8e6de330560661aa3"

--001a1147e4e8e6de330560661aa3
Content-Type: text/plain; charset="UTF-8"

I work with a lot of python recipes in meta-cloud-services and
especially the openstack packages have a large number of dependencies.
Find attached a basic script I have written to help parse
requirements.txt files. It might help you out with this work.

Anyway, I will send out a V2 with the additional cherrypicks.

On Fri, Dec 15, 2017 at 2:30 PM, Derek Straka <derek@asterius.io> wrote:
> Yeah.  Agreed.  These commits are me cleaning up the RDEPENDS to work with
> minimal python installs.  Meta-python has been pretty bad about setting the
> dependencies.  I just missed the news package.  Thanks.
>
> On Dec 15, 2017 2:22 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
> wrote:
>
>> No problem. Unfortunately your commit log was thin on information so I
>> had to make some assumptions as to what you were doing in the commit.
>> I could have easily misinterpreted.
>>
>> On Fri, Dec 15, 2017 at 2:19 PM, Derek Straka <derek@asterius.io> wrote:
>> > Sure.  I wasn't clear and even then I misread the 1/2 patch and thought I
>> > removed news from core and not the base package RDEPENDS.
>> >
>> > On Dec 15, 2017 2:08 PM, "Mark Asselstine" <
>> mark.asselstine@windriver.com>
>> > wrote:
>> >
>> > The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
>> > don't know what parts you want you install ${PN} and get everything.
>> > We can straighten this up though if my thoughts are incorrect. I have
>> > to send a V2 anyway as I was hasty and missed the cherrypick of a
>> > bunch of dependencies you added for automat and others.
>> >
>> > Mark
>> >
>> > On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io> wrote:
>> >> Is it actually required for core?  I thought I went through and verified
>> >> that news was a stand alone module.
>> >>
>> >> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <
>> mark.asselstine@windriver.com
>> >>
>> >> wrote:
>> >>
>> >>> Although this plugin has not yet been ported to py3 it is available in
>> >>> py2. The previous commit isn't clear about what is being addressed but
>> >>> I assume it is:
>> >>>
>> >>> nothing provides python3-twisted-news needed by
>> > python3-twisted-17.9.0-r0.
>> >>> corei7_64
>> >>>
>> >>> For py2 this package is valid and so we should maintain the RDEPENDS,
>> >>> restore this RDEPENDS for py2.
>> >>>
>> >>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> >>> ---
>> >>>  meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6
>> ++++++
>> >>>  1 file changed, 6 insertions(+)
>> >>>
>> >>> diff --git a/meta-python/recipes-devtools/python/python-
>> twisted_17.9.0.bb
>> >>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> >>> index 2be1709..7fc8c65 100644
>> >>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> >>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
>> >>> @@ -2,3 +2,9 @@ inherit pypi setuptools
>> >>>  require python-twisted.inc
>> >>>
>> >>>  RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
>> >>> +
>> >>> +# Not yet ported to py3 yet available in py2
>> >>> +# See src/twisted/python/_setup.py -- notPortedModules
>> >>> +RDEPENDS_${PN} += "\
>> >>> +    ${PN}-news \
>> >>> +    "
>> >>> --
>> >>> 2.7.4
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--001a1147e4e8e6de330560661aa3
Content-Type: text/x-python; charset="US-ASCII"; name="requires.py"
Content-Disposition: attachment; filename="requires.py"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jb8bag680

IyEvdXNyL2Jpbi9weXRob24KCmltcG9ydCBvcwppbXBvcnQgcmUKaW1wb3J0IHN5cwppbXBvcnQg
b3BlcmF0b3IKaW1wb3J0IGNvbGxlY3Rpb25zCmZyb20gZGlzdHV0aWxzLnZlcnNpb24gaW1wb3J0
IExvb3NlVmVyc2lvbiwgU3RyaWN0VmVyc2lvbgoKcmVxdWlyZXMgPSBzeXMuYXJndlsxXQoKb3Bz
ID0geyI+PSI6IG9wZXJhdG9yLmdlLAogICAgICAgIjw9Ijogb3BlcmF0b3IubGUsCiAgICAgICAi
PT0iOiBvcGVyYXRvci5lcSwKICAgICAgICIhPSI6IG9wZXJhdG9yLm5lLAogICAgICAgIjwiOiBv
cGVyYXRvci5sdCwKICAgICAgICI+Ijogb3BlcmF0b3IuZ3QsCn0KCmRlZiBwYXJzZV92ZXJzaW9u
X2luZm8obGluZSk6CiAgICAjIHJlbW92ZSBhbnkgY29tbWVudCBmcm9tIHRoZSBlbmQgb2YgdGhl
IGxpbmUKICAgIHN0cmlwcGVkID0gbGluZS5zcGxpdCgnIycpWzBdCgogICAgIyBnZXQgcGFja2Fn
ZSBuYW1lCiAgICBwa2cgPSByZS5zcGxpdCgnPnw8fD18IScsIHN0cmlwcGVkKVswXS5sb3dlcigp
LnN0cmlwKCkKICAgIGlmIG5vdCByZS5tYXRjaCgiXnB5dGhvbi0iLCBwa2cpOgogICAgICAgIHBr
ZyA9ICJweXRob24tJXMiICUgcGtnCgogICAgIyBnZXQgdmVyc2lvbiBzdHJpbmcKICAgIHJhd19w
a2cgPSByZS5zcGxpdCgnPnw8fD18IScsIHN0cmlwcGVkKVswXQogICAgdnN0ciA9IHN0cmlwcGVk
LnNwbGl0KHJhd19wa2cpWzE6XVswXS5zdHJpcCgpCgogICAgcmV0dXJuIChwa2csdnN0cikKCmRl
ZiBwcmludF9yZGVwZW5kcyhkZXBzKToKICAgIHByaW50KCJSREVQRU5EU18ke1BOfSArPSBcIiBc
XCIpCiAgICBmb3IgZGVwIGluIGRlcHM6CiAgICAgICAgcHJpbnQoIiAgICAgICAgJXMgXFwiICUg
ZGVwKQogICAgcHJpbnQoIiAgICAgICAgXCIiKQoKZGVmIGNoZWNrX3JkZXBlbmRzX3ZlcnNpb25z
KGRlcHMpOgogICAgZm9yIGRlcCBpbiBkZXBzOgogICAgICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0
cygidG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC8lcyIgJSBkZXApOgogICAgICAgICAgICBw
cmludCgiVW5hYmxlIHRvIGZpbmQgJyVzJyIgJSBkZXApCiAgICAgICAgICAgIHJldHVybgoKICAg
ICAgICBmb3VuZF92ZXIgPSBvcy5saXN0ZGlyKCJ0bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4
LyVzLyIgJSBkZXApWzBdCiAgICAgICAgIyBEcm9wIHRoZSBQUgogICAgICAgIGZvdW5kX3ZlciA9
IGZvdW5kX3Zlci5zcGxpdCgnLScpWzotMV1bMF0KICAgICAgICAjIERyb3AgdGhlICcrZ2l0JHtT
UkNQVn0nCiAgICAgICAgZm91bmRfdmVyID0gcmUuY29tcGlsZSgiXCtnaXQuKiIpLnNwbGl0KGZv
dW5kX3ZlcilbMF0KCiAgICAgICAgY2hlY2sgPSAiT0siOwogICAgICAgIHJlcV92ZXIgPSBkZXBz
W2RlcF0KICAgICAgICBmb3IgY29uZGl0aW9uIGluIHJlcV92ZXIuc3BsaXQoJywnKToKICAgICAg
ICAgICAgY29uZGl0aW9uID0gY29uZGl0aW9uLnN0cmlwKCkKICAgICAgICAgICAgbSA9IHJlLm1h
dGNoKCdeKD49fDw9fCE9fD09fDx8PiknLCBjb25kaXRpb24pCiAgICAgICAgICAgIGlmIG06CiAg
ICAgICAgICAgICAgICBvcGVyYXRpb24gPSBjb25kaXRpb25bOm0uZW5kKCldCiAgICAgICAgICAg
ICAgICB2ZXJzaW9uID0gY29uZGl0aW9uW20uZW5kKCk6XS5zdHJpcCgpCiAgICAgICAgICAgICAg
ICBpZiBub3Qgb3BzW29wZXJhdGlvbl0oTG9vc2VWZXJzaW9uKGZvdW5kX3ZlcikgLExvb3NlVmVy
c2lvbih2ZXJzaW9uKSk6CiAgICAgICAgICAgICAgICAgICAgY2hlY2sgPSAiRkFJTEVEIgogICAg
ICAgICAgICAgICAgICAgIGJyZWFrCiAgICAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICAgICBj
aGVjayA9ICJVTktOT1dOIgogICAgICAgICAgICAgICAgYnJlYWsKCiAgICAgICAgcHJpbnQoIiVz
ICVzIDwtPiAlcyAgICVzIiAlIChkZXAsIGZvdW5kX3ZlciwgcmVxX3ZlciwgY2hlY2spKQoKZGVm
IHBrZ19tYXBwaW5nKHBrZyk6CiAgICBtYXBwaW5ncyA9IHsKICAgICAgICAncHl0aG9uLW1zZ3Bh
Y2stcHl0aG9uJzoncHl0aG9uLW1zZ3BhY2snLAogICAgfQogICAgaWYgcGtnIGluIG1hcHBpbmdz
OgogICAgICAgIHJldHVybiBtYXBwaW5nc1twa2ddCiAgICBlbHNlOgogICAgICAgIHJldHVybiBw
a2cKCmRlcGVuZGVuY2llcyA9IGNvbGxlY3Rpb25zLk9yZGVyZWREaWN0KCkKd2l0aCBvcGVuKHJl
cXVpcmVzLCAncicpIGFzIGZpbjoKICAgIGZvciBsaW5lIGluIGZpbjoKICAgICAgICBpZiBub3Qg
bGluZS5zdGFydHN3aXRoKCcjJykgYW5kIG5vdCBsaW5lLnN0cmlwKCkgPT0gIiI6CiAgICAgICAg
ICAgIChwa2csIHZzdHIpID0gcGFyc2VfdmVyc2lvbl9pbmZvKGxpbmUpCiAgICAgICAgICAgIHBr
ZyA9IHBrZ19tYXBwaW5nKHBrZykKICAgICAgICAgICAgZGVwZW5kZW5jaWVzW3BrZ10gPSB2c3Ry
CiAgICBwcmludF9yZGVwZW5kcyhkZXBlbmRlbmNpZXMpCiAgICBjaGVja19yZGVwZW5kc192ZXJz
aW9ucyhkZXBlbmRlbmNpZXMpCg==

--001a1147e4e8e6de330560661aa3--
