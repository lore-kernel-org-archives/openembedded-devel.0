Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 574CD71B32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 21:00:59 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d13so5463207iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 13:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=2uHnW7rzAg6/7HUfKXCH8/8Hv1sdRcL/rpyb6hw5KAs=;
	b=gXxEyT0xyXzvxm7WnZfS4UmeLYuHDDccj+mLoDvd8ORQhWw3KBPMWPt6hbVPGgvEwI
	naqKnj4ynxbLFO7yzxY7GKcxFMOqZmyjsMUQg4EjjE/T1xga8DaljlL8Mb6yZN2zTszh
	LX1neC+mJNlITOonP+ZRUzz7JxMtE+NeUqsKIcmDUbDIvGcr4mw4GeOA0uUKbuYKggKA
	R3QhjNywyufdTAE5aTOI3LEmqsDklb+gy4AKa8JSr2BaOZpWQ6o8/har1qMa571SNj4T
	Bywy0lUDk2AvmHQJ2bXiqiEQYYlKpf/WDf9zAndkILuROM85ZZ59k3Y/Xz+kcEr5qiEB
	NnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=2uHnW7rzAg6/7HUfKXCH8/8Hv1sdRcL/rpyb6hw5KAs=;
	b=sL8DmWlkvcpb7BObL1+HmliEjfNfjPurlqmw/V7ZS2mSNOr2eXT6+KHSImtY1LNGOw
	TP9NgcFXzPYUFeQC4s93yfG84njTBmTnUSnq+dThiLSfoinF8KYMfgKZ2mfJGgteDXQH
	ECEB4914NlBs3Yw5CvjJX1+2hxG92Mdlt/dNwGV1PozFQrASthER1PV+/3Exmov97vkl
	IZ1TO1EVu69GdvksqH7SGkf+Asubq1TLUaUDScoRNfTDPBEYIWqYIhguesy3OzPaZ/vP
	TrVT/4WdaYhpttcsj+Z/Ve/84ra24sC+TJ0apF/A16PwcICZU3fFtruIaH5C7u5W8HtZ
	0Zcw==
X-Gm-Message-State: APf1xPBbaPVfY0Dhrj1HD8kwbrIVmdrlA0H3BEU4K9yseTbS+nhj/n/u
	tLd/qjDQjD4dXI1zxW+IBnM=
X-Google-Smtp-Source: AH8x225b9TG5ElXgDs3g+QSDZ+tkZnpcm2HFJG3HOy7uAENM00BR9pNDslQywmLGl8u8t6Ba0vubyQ==
X-Received: by 10.107.15.156 with SMTP id 28mr5178617iop.118.1518814860574;
	Fri, 16 Feb 2018 13:01:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	k66sm17108789itd.8.2018.02.16.13.00.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 13:01:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518814859.6900.49.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 15:00:59 -0600
In-Reply-To: <CA+chaQeE4=jqCufB3f+O2E=cHp-TxbZyW-kLwq_xPY5dQjzN4A@mail.gmail.com>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
	<20180215232440.GM2786@denix.org>
	<CAMKF1srn=JvEXM2WG2Y0r_L+iB-dT44LFgMU7LmeFq3etiauTw@mail.gmail.com>
	<20180215233345.GP2786@denix.org>
	<CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
	<20180216010333.GR2786@denix.org>
	<CA+chaQdkwxsJ1Z0wvPFEDwi4h+NsXzEapUqyxsqNDsTEg453SQ@mail.gmail.com>
	<CA+chaQeYpA1oM3pHLu9Nuw3e+sGipvOnXh9GVinJQaAOFwHs2g@mail.gmail.com>
	<1518812283.6900.47.camel@gmail.com>
	<CA+chaQeE4=jqCufB3f+O2E=cHp-TxbZyW-kLwq_xPY5dQjzN4A@mail.gmail.com>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: libtalloc failure due to waf
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
X-List-Received-Date: Fri, 16 Feb 2018 21:01:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-02-16 at 21:55 +0100, Martin Jansa wrote:
> Don't you want to update that one to use the new function from utils
> instead of re-introducing get_waf_parallel_make?

.... yes. I guess I can do that now. It didn't exist when I wrote the
first version of this patch
> On Fri, Feb 16, 2018 at 9:18 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
> > > And now it will fail to parse as well:
> > > http://git.openembedded.org/openembedded-core/commit/?id=ccd1142d
> > > 22b31ed85d8823b1bc9e11ccfd72b61f
> > > 
> > > removed get_waf_parallel_make from waf.bbclass, so now all waf-
> > > samba.bbclass users will fail to parse with:
> > 
> > http://lists.openembedded.org/pipermail/openembedded-devel/2018-Feb
> > ruary/116701.html will fix that as well.... We probably need to
> > speed along that getting merged.
> > Armin can you help with that? 
> > 
> > This patch should resolve all of the waf issues that have been
> > discussed here, with exception of the one improvement proposed by
> > Denys. While it should probably be improved, I don't beleive it
> > actually affects any recipes (some please give me an example if I
> > am wrong).
> > 
> > Sorry for the churn. Hopefull this will be better in the future
> > since waf and samba-waf are no longer tied together.
> > 
> > Joshua Watt
> > > bb.data_smart.ExpansionError: Failure expanding variable
> > > do_compile, expression was  
> > >     python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> > >  which triggered exception NameError: name
> > > 'get_waf_parallel_make' is not defined
> > > On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gmail
> > > .com> wrote:
> > > > Check this thread:
> > > > http://lists.openembedded.org/pipermail/openembedded-commits/20
> > > > 18-January/218460.html
> > > > 
> > > > but my patch wasn't merged:
> > > > http://lists.openembedded.org/pipermail/openembedded-core/2018-
> > > > January/146974.html
> > > > only the one from Joshua.
> > > > 
> > > > 
> > > > The original issue is still in rocko as well, the backported
> > > > waf change doesn't work and causes useless warning.
> > > > 
> > > > Either the "waf.bbclass: explicitly pass bindir and libdir if
> > > > supported" should be reverted in rocko or all fixes for this
> > > > should be backported to rocko once they are all in oe-core and
> > > > meta-oe master.
> > > > 
> > > > Regards,
> > > > 
> > > > On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@denix
> > > > .org> wrote:
> > > > > On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> > > > > 
> > > > > > On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org
> > > > > > wrote:
> > > > > 
> > > > > >
> > > > > 
> > > > > > On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> > > > > 
> > > > > > > On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis
> > > > > @denix.org>
> > > > > 
> > > > > > wrote:
> > > > > 
> > > > > > > > On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling
> > > > > wrote:
> > > > > 
> > > > > > > >> Then why did ‘sudo dnf install waf’ get me past the
> > > > > error above? And
> > > > > 
> > > > > > why
> > > > > 
> > > > > > > >> does Fedora have a package for it?
> > > > > 
> > > > > > > >>
> > > > > 
> > > > > > > >> https://src.fedoraproject.org/rpms/waf
> > > > > 
> > > > > > > >>
> > > > > 
> > > > > > > >> Regardless, something broke.
> > > > > 
> > > > > > > >
> > > > > 
> > > > > > > > I thought so too. As waf.bbclass from oe-core looks for
> > > > > waf binary in
> > > > > 
> > > > > > the root
> > > > > 
> > > > > > > > of the source package, I looked inside libtalloc 2.1.9
> > > > > and 2.1.10 and
> > > > > 
> > > > > > neither
> > > > > 
> > > > > > > > of them have any "waf" files at the root. How was it
> > > > > working before?
> > > > > 
> > > > > > What
> > > > > 
> > > > > > > > broke?
> > > > > 
> > > > > > >
> > > > > 
> > > > > > > its using waf-samba.bbclass, there is a patch floating
> > > > > for that
> > > > > 
> > > > > > > https://patchwork.openembedded.org/patch/148046/
> > > > > 
> > > > > >
> > > > > 
> > > > > > So, it will fix libtalloc, but some other packages that
> > > > > still use
> > > > > 
> > > > > > waf.bbclass
> > > > > 
> > > > > > will keep on failing with an exception?
> > > > > 
> > > > > >
> > > > > 
> > > > > >
> > > > > 
> > > > > > They shouldn't. I tested all the ones I could find. The way
> > > > > waf-samba uses
> > > > > 
> > > > > > waf is more of the exception than the rule.... Most
> > > > > projects will follow
> > > > > 
> > > > > > the waf.bbclass pattern of a wscript and waf in $S, but we
> > > > > can probably
> > > > > 
> > > > > > parameterize it if necessary.
> > > > > 
> > > > > >
> > > > > 
> > > > > > Do you know of a specific recipe that fails?
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > No, but as Andre said here earlier, it should be more
> > > > > forgiving when ${S}/waf
> > > > > 
> > > > > is not available or at least give a proper error message
> > > > > instead of dumping a
> > > > > 
> > > > > cryptic exception stack...
> > > > > 
> > > > > 
> > > > > 
> > > > > In other words, before this waf.bbclass change in oe-core it
> > > > > was handling such
> > > > > 
> > > > > situation just fine and there was a warning "Unable to
> > > > > execute waf --version,
> > > > > 
> > > > > exit code 127". Now it never reaches that code and just
> > > > > throws an exception.
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > > > >> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacke
> > > > > r@gmail.com>
> > > > > 
> > > > > > wrote:
> > > > > 
> > > > > > > >>
> > > > > 
> > > > > > > >> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > > > > 
> > > > > > > >> > > Seeing the same and trying to figure it out. Also,
> > > > > seems there is
> > > > > 
> > > > > > no
> > > > > 
> > > > > > > >> > > recipe
> > > > > 
> > > > > > > >> > > for waf-native, so it becomes a new required host
> > > > > tool.
> > > > > 
> > > > > > > >> >
> > > > > 
> > > > > > > >> > There is no "waf" tool, so a "waf-native" tool
> > > > > doesn't make sense...
> > > > > 
> > > > > > > >> > it's not how waf works. Each project has their own
> > > > > copy of the waf
> > > > > 
> > > > > > > >> > program, it's not something the host has to provide.
> > > > > 
> > > > > > > >> >
> > > > > 
> > > > > > > >> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko
> > > > > <denis@denix.org>
> > > > > 
> > > > > > > >> > > wrote:
> > > > > 
> > > > > > > >> > >
> > > > > 
> > > > > > > >> > > > Hi,
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> > > > I'm getting below stack dump building libtalloc
> > > > > 2.1.10 in master.
> > > > > 
> > > > > > > >> > > > Works
> > > > > 
> > > > > > > >> > > > fine in
> > > > > 
> > > > > > > >> > > > rocko with libtalloc 2.1.9. I need it for cifs-
> > > > > utils. I'm not
> > > > > 
> > > > > > > >> > > > familiar with
> > > > > 
> > > > > > > >> > > > waf, any help? Thanks.
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error
> > > > > executing a python
> > > > > 
> > > > > > > >> > > > function
> > > > > 
> > > > > > > >> > > > in exec_python_func() autogenerated:
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> > > > The stack trace of python calls that resulted in
> > > > > this
> > > > > 
> > > > > > > >> > > > exception/failure
> > > > > 
> > > > > > > >> > > > was:
> > > > > 
> > > > > > > >> > > > File: 'exec_python_func() autogenerated',
> > > > > lineno: 2, function:
> > > > > 
> > > > > > > >> > > > <module>
> > > > > 
> > > > > > > >> > > >      0001:
> > > > > 
> > > > > > > >> > > >  *** 0002:waf_preconfigure(d)
> > > > > 
> > > > > > > >> > > >      0003:
> > > > > 
> > > > > > > >> > > > File: '/OE/master/sources/oe-
> > > > > core/meta/classes/waf.bbclass',
> > > > > 
> > > > > > > >> > > > lineno: 34,
> > > > > 
> > > > > > > >> > > > function: waf_preconfigure
> > > > > 
> > > > > > > >> > > >      0030:    from distutils.version import
> > > > > StrictVersion
> > > > > 
> > > > > > > >> > > >      0031:    subsrcdir = d.getVar('S')
> > > > > 
> > > > > > > >> > > >      0032:    wafbin = os.path.join(subsrcdir,
> > > > > 'waf')
> > > > > 
> > > > > > > >> > > >      0033:    try:
> > > > > 
> > > > > > > >> > > >  *** 0034:        result =
> > > > > subprocess.check_output([wafbin, '
> > > > > 
> > > > > > > >> > > > --version'],
> > > > > 
> > > > > > > >> > > > cwd=subsrcdir, stderr=subprocess.STDOUT)
> > > > > 
> > > > > > > >> > > >      0035:        version = result.decode('utf-
> > > > > 8').split()[1]
> > > > > 
> > > > > > > >> > > >      0036:        if StrictVersion(version) >=
> > > > > 
> > > > > > > >> > > > StrictVersion("1.8.7"):
> > > > > 
> > > > > > > >> > > >      0037:            d.setVar("WAF_EXTRA_CONF",
> > > > > "
> > > > > 
> > > > > > > >> > > > --bindir=${bindir}
> > > > > 
> > > > > > > >> > > > --libdir=${libdir}")
> > > > > 
> > > > > > > >> > > >      0038:    except
> > > > > subprocess.CalledProcessError as e:
> > > > > 
> > > > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py',
> > > > > lineno: 626, function:
> > > > > 
> > > > > > > >> > > > check_output
> > > > > 
> > > > > > > >> > > >      0622:        # empty string. That is
> > > > > maintained here for
> > > > > 
> > > > > > > >> > > > backwards
> > > > > 
> > > > > > > >> > > > compatibility.
> > > > > 
> > > > > > > >> > > >      0623:        kwargs['input'] = '' if
> > > > > 
> > > > > > > >> > > > kwargs.get('universal_newlines',
> > > > > 
> > > > > > > >> > > > False) else b''
> > > > > 
> > > > > > > >> > > >      0624:
> > > > > 
> > > > > > > >> > > >      0625:    return run(*popenargs,
> > > > > stdout=PIPE,
> > > > > 
> > > > > > timeout=timeout,
> > > > > 
> > > > > > > >> > > > check=True,
> > > > > 
> > > > > > > >> > > >  *** 0626:               **kwargs).stdout
> > > > > 
> > > > > > > >> > > >      0627:
> > > > > 
> > > > > > > >> > > >      0628:
> > > > > 
> > > > > > > >> > > >      0629:class CompletedProcess(object):
> > > > > 
> > > > > > > >> > > >      0630:    """A process that has finished
> > > > > running.
> > > > > 
> > > > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py',
> > > > > lineno: 693, function:
> > > > > 
> > > > > > > >> > > > run
> > > > > 
> > > > > > > >> > > >      0689:        if 'stdin' in kwargs:
> > > > > 
> > > > > > > >> > > >      0690:            raise ValueError('stdin
> > > > > and input arguments
> > > > > 
> > > > > > > >> > > > may not
> > > > > 
> > > > > > > >> > > > both be used.')
> > > > > 
> > > > > > > >> > > >      0691:        kwargs['stdin'] = PIPE
> > > > > 
> > > > > > > >> > > >      0692:
> > > > > 
> > > > > > > >> > > >  *** 0693:    with Popen(*popenargs, **kwargs)
> > > > > as process:
> > > > > 
> > > > > > > >> > > >      0694:        try:
> > > > > 
> > > > > > > >> > > >      0695:            stdout, stderr =
> > > > > process.communicate(input,
> > > > > 
> > > > > > > >> > > > timeout=timeout)
> > > > > 
> > > > > > > >> > > >      0696:        except TimeoutExpired:
> > > > > 
> > > > > > > >> > > >      0697:            process.kill()
> > > > > 
> > > > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py',
> > > > > lineno: 947, function:
> > > > > 
> > > > > > > >> > > > __init__
> > > > > 
> > > > > > > >> > > >      0943:                               
> > > > > startupinfo,
> > > > > 
> > > > > > > >> > > > creationflags,
> > > > > 
> > > > > > > >> > > > shell,
> > > > > 
> > > > > > > >> > > >      0944:                               
> > > > > p2cread, p2cwrite,
> > > > > 
> > > > > > > >> > > >      0945:                               
> > > > > c2pread, c2pwrite,
> > > > > 
> > > > > > > >> > > >      0946:                               
> > > > > errread, errwrite,
> > > > > 
> > > > > > > >> > > >  *** 0947:                               
> > > > > restore_signals,
> > > > > 
> > > > > > > >> > > > start_new_session)
> > > > > 
> > > > > > > >> > > >      0948:        except:
> > > > > 
> > > > > > > >> > > >      0949:            # Cleanup if the child
> > > > > failed starting.
> > > > > 
> > > > > > > >> > > >      0950:            for f in filter(None,
> > > > > (self.stdin,
> > > > > 
> > > > > > > >> > > > self.stdout,
> > > > > 
> > > > > > > >> > > > self.stderr)):
> > > > > 
> > > > > > > >> > > >      0951:                try:
> > > > > 
> > > > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py',
> > > > > lineno: 1551, function:
> > > > > 
> > > > > > > >> > > > _execute_child
> > > > > 
> > > > > > > >> > > >      1547:                                # The
> > > > > error must be
> > > > > 
> > > > > > from
> > > > > 
> > > > > > > >> > > > chdir(cwd).
> > > > > 
> > > > > > > >> > > >      1548:                               
> > > > > err_msg += ': ' +
> > > > > 
> > > > > > > >> > > > repr(cwd)
> > > > > 
> > > > > > > >> > > >      1549:                            else:
> > > > > 
> > > > > > > >> > > >      1550:                               
> > > > > err_msg += ': ' +
> > > > > 
> > > > > > > >> > > > repr(orig_executable)
> > > > > 
> > > > > > > >> > > >  *** 1551:                    raise
> > > > > child_exception_type(errno_
> > > > > 
> > > > > > num,
> > > > > 
> > > > > > > >> > > > err_msg)
> > > > > 
> > > > > > > >> > > >      1552:                raise
> > > > > child_exception_type(err_msg)
> > > > > 
> > > > > > > >> > > >      1553:
> > > > > 
> > > > > > > >> > > >      1554:
> > > > > 
> > > > > > > >> > > >      1555:        def _handle_exitstatus(self,
> > > > > sts,
> > > > > 
> > > > > > > >> > > > _WIFSIGNALED=os.WIFSIGNALED,
> > > > > 
> > > > > > > >> > > > Exception: FileNotFoundError: [Errno 2] No such
> > > > > file or
> > > > > 
> > > > > > directory:
> > > > > 
> > > > > > > >> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-
> > > > > oe-linux-
> > > > > 
> > > > > > > >> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure:
> > > > > Function failed:
> > > > > 
> > > > > > > >> > > > waf_preconfigure
> > > > > 
> > > > > > > >> > > > ERROR: Logfile of failure stored in:
> > > > > 
> > > > > > > >> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-
> > > > > oe-linux-
> > > > > 
> > > > > > > >> > > > gnueabi/libtalloc/2.1.10-
> > > > > r0/temp/log.do_configure.52699
> > > > > 
> > > > > > > >> > > > ERROR: Task
> > > > > 
> > > > > > > >> > > > (/OE/master/sources/meta-openembedded/meta-
> > > > > networking/recipes-
> > > > > 
> > > > > > > >> > > >
> > > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > > > > 
> > > > > > > >> > > > failed with exit code '1'
> > > > > 
> > > > > > > >> > > > --
> > > > > 
> > > > > > > >> > > > _______________________________________________
> > > > > 
> > > > > > > >> > > > Openembedded-devel mailing list
> > > > > 
> > > > > > > >> > > > Openembedded-devel@lists.openembedded.org
> > > > > 
> > > > > > > >> > > > http://lists.openembedded.org/mailman/listinfo/o
> > > > > penembedded-devel
> > > > > 
> > > > > > > >> > > >
> > > > > 
> > > > > > > >> >
> > > > > 
> > > > > > > > --
> > > > > 
> > > > > > > > _______________________________________________
> > > > > 
> > > > > > > > Openembedded-devel mailing list
> > > > > 
> > > > > > > > Openembedded-devel@lists.openembedded.org
> > > > > 
> > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembe
> > > > > dded-devel
> > > > > 
> > > > > > >
> > > > > 
> > > > > > --
> > > > > 
> > > > > > _______________________________________________
> > > > > 
> > > > > > Openembedded-devel mailing list
> > > > > 
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > 
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded
> > > > > -devel
> > > > > 
> > > > > --
> > > > > 
> > > > > _______________________________________________
> > > > > 
> > > > > Openembedded-devel mailing list
> > > > > 
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > 
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-d
> > > > > evel
> > > > > 
From gmills@linux.vnet.ibm.com  Fri Feb 16 21:14:08 2018
Return-Path: <gmills@linux.vnet.ibm.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
X-Greylist: delayed 1936 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Feb 2018 21:14:07 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by mail.openembedded.org (Postfix) with ESMTP id 16B666074F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 21:14:07 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w1GKcoWu085472 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 15:41:53 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2g642nd98t-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 15:41:52 -0500
Received: from localhost
	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <openembedded-devel@lists.openembedded.org> from
	<gmills@linux.vnet.ibm.com>; Fri, 16 Feb 2018 15:41:52 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
	by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 16 Feb 2018 15:41:50 -0500
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
	[9.57.199.108])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	w1GKfna358130474; Fri, 16 Feb 2018 20:41:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 875C1B2056;
	Fri, 16 Feb 2018 15:38:11 -0500 (EST)
Received: from gfw162.aus.stglabs.ibm.com (unknown [9.3.62.92])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 4CBAFB2046;
	Fri, 16 Feb 2018 15:38:11 -0500 (EST)
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Feb 2018 14:41:46 -0600
X-Mailer: git-send-email 2.7.2
X-TM-AS-GCONF: 00
x-cbid: 18021620-0056-0000-0000-0000041F6B35
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008544; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000254; SDB=6.00990712; UDB=6.00503162;
	IPR=6.00770058; 
	MB=3.00019592; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-16 20:41:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021620-0057-0000-0000-000008616D32
Message-Id: <1518813706-3315-1-git-send-email-gmills@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-02-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=2
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1802160241
Subject: [oe] [meta-oe][PATCH] nodejs: Add support for building on ppc64le
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
X-List-Received-Date: Fri, 16 Feb 2018 21:14:08 -0000

ppc64le is a little-endian mode of ppc64.
Nodejs determines the endianness of the system and
since it already supports bi-endian ppc64, just pass
nodejs "ppc64" when the TARGET_ARCH is ppc64le.

Signed-off-by: Gunnar Mills <gmills@linux.vnet.ibm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
index 1cab6a4..3806aac 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.0.bb
@@ -26,7 +26,7 @@ def map_nodejs_arch(a, d):
     if   re.match('i.86$', a): return 'ia32'
     elif re.match('x86_64$', a): return 'x64'
     elif re.match('aarch64$', a): return 'arm64'
-    elif re.match('powerpc64$', a): return 'ppc64'
+    elif re.match('(powerpc64|ppc64le)$', a): return 'ppc64'
     elif re.match('powerpc$', a): return 'ppc'
     return a
 
-- 
2.7.2


