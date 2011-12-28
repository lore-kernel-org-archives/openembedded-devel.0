Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Rfwvo-0001Vs-4Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 18:04:48 +0100
Received: by obcwn6 with SMTP id wn6so8878973obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2011 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Fu5XF7+/lfgIwdkBTfe5vzyTgXOyOg7xceC5aS3Ok2k=;
	b=Ni/FT6HReY5xvRKzFXwqBWMmfmhPScWWavuda4A8oyyKAz+5zLxJuocyqRY2KD0Zlx
	TztX07EomqQqMa9mVEY7lVZLf7s6PFnOlBapY3T6yAtImOvhZSGm5KgF2UkEF5zfr8c5
	JdkH+tVuRgNBQGOZYAfr6WLKxbIwmh3ndIM5M=
MIME-Version: 1.0
Received: by 10.50.135.41 with SMTP id pp9mr36647053igb.8.1325091453083; Wed,
	28 Dec 2011 08:57:33 -0800 (PST)
Received: by 10.231.3.70 with HTTP; Wed, 28 Dec 2011 08:57:33 -0800 (PST)
In-Reply-To: <1535311.D6ZbQ8u8yE@helios>
References: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
	<1535311.D6ZbQ8u8yE@helios>
Date: Wed, 28 Dec 2011 17:57:33 +0100
Message-ID: <CAOHjBZtAzdpynVMt6m=ofp6P+Xy9i7=NXaBU2mgT-4uR8MXf4Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Python2.7.2 compatibility
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
X-List-Received-Date: Wed, 28 Dec 2011 17:04:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is the log error I catch, I can think it is due to python but maybe
I'm wrong.

---------------------------------
bitbake base-image
ERROR: There is a comment on line 24 of file
/home/condorg/work/openembedded/recipes/ekiga/ekiga_git.bb (#
--enable-static-libs \) which is in the middle of a multiline expression.
Bitbake used to ignore these but no longer does so, please fix your
metadata as errors are likely as a result of this change.
ERROR: There is a comment on line 15 of file
/home/condorg/work/openembedded/recipes/supertux/supertux.inc (#
http://ssel.vub.ac.be/Members/DennisWagelaar/download/zaurus/supertux-0.1.2-fp.patch.gz\)
which is in the middle of a multiline expression.
Bitbake used to ignore these but no longer does so, please fix your
metadata as errors are likely as a result of this change.
ERROR: There is a comment on line 15 of file
/home/condorg/work/openembedded/recipes/supertux/supertux.inc (#
http://ssel.vub.ac.be/Members/DennisWagelaar/download/zaurus/supertux-0.1.2-fp.patch.gz\)
which is in the middle of a multiline expression.
Bitbake used to ignore these but no longer does so, please fix your
metadata as errors are likely as a result of this change.
ERROR: Unable to parse /home/condorg/work/openembedded/recipes/supertux/
supertux_0.1.3.bb
Traceback (most recent call last):
  File "base.bbclass", line 11, in
set_multimach_arch(d=<bb.data_smart.DataSmart object at 0xaca7e0c>)
  File "utils.bbclass", line 4, in
is_machine_specific(d=<bb.data_smart.DataSmart object at 0xaca7e0c>)
  File "/home/condorg/work/bitbake/lib/bb/fetch/__init__.py", line 209, in
init(urls=['
http://downloads.sourceforge.net/super-tux/supertux-0.1.3.tar.bz2', '#', '
http://ssel.vub.ac.be/Members/DennisWagelaar/download/zaurus/supertux-0.1.2-fp.patch.gz',
'file://supertux.png', 'file://install-no-overwrite.patch',
'file://compilation-fixes.patch', 'file://supertux.desktop'],
d=<bb.data_smart.DataSmart object at 0xaca7e0c>, setup=True):
             if url not in urldata:
    >            urldata[url] = FetchData(url, d)

  File "/home/condorg/work/bitbake/lib/bb/fetch/__init__.py", line 527, in
FetchData.__init__(url='#', d=<bb.data_smart.DataSmart object at
0xaca7e0c>):
             self.localfile = ""
    >        (self.type, self.host, self.path, self.user, self.pswd,
self.parm) = decodeurl(data.expand(url, d))
             self.date = Fetch.getSRCDate(self, d)
  File "/home/condorg/work/bitbake/lib/bb/fetch/__init__.py", line 68, in
decodeurl(url='#'):
         if not m:
    >        raise MalformedUrl(url)

MalformedUrl: #
----------------------------------

2011/12/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Wednesday 28 December 2011 16:43:55 Giuseppe Condorelli wrote:
> > I moved to two VM (Fedora16 and Ubuntu11.10). Both have python2.7.2
> > I have problem using bitbake against this python version.
> > Is this a known problem or I'm missing something?
> > I had this problem with both best so far bitbake (git clone) and previous
> > stable versions.
>
> Could you be more specific about the problem you are having, and what
> version
> of BitBake you are using? I am using Python 2.7.2+ on Ubuntu 11.10 with no
> problems.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

