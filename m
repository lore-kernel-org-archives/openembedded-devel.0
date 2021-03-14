Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web11.604.1615681319218372539
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 16:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=MPTOWHH+;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzgLN4lwPEDo/24YG6hPIFiTE5WdhvK0AffvRQJR4Kd5+wgDpupIqHTpVJ/4noKpELxWm7GFxx5h15sg+iuLvVfco+y5tdJZM1ilEJVA5TgKDQec/AYu7/kWT+Fe2T4Z0cdL2Zbr5PzFKSzbpGo9rqVuY8quKsKaozqhRhT1p4ZMxZAM4Ur2xX+PPv0quskyKSzqo/d2GWXJ4otXB2hDHcfAtxnM962+nXQnX9YpffS0IQ4n0N+zQ2I1gTx1zpt5dQ5OTSKhDpWcy18AvfB3VEtRnltnWLovTT7ZrURUclNlXkLf9wjkebKvMbbMvnyec8gHAy2XSJKKtc1r7gPJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9FA/m4qRapPj5vL8TSfRXIFFqcy60Je/jiudgQZTc4=;
 b=AzmHoVi6YCXU/+6aQ1lmohdjhYLx8sjjeZaeKSyCiYggdP7RkFsufsl5ZAH7H9cH8wlQf8nbRzTNhjs6HaDv7x88h+x0eKJVmIm/+PJs+7r6HDQLZNKJZKW7aH2s/m+FaRWigBMQRd/LNocb3MQSYM5UYEx8ACAiR6/GFJ5uCnThlhVbQ5iiTom0Y+MEqAfK91jape4veoEdFKG4FOAIuLh8RUmOka9JoLnkWCcKdwvWI4WOFh0ntn6NRH/kfN11G16U0dFwUV1FMzzdLE47nJ5RjqEa4NOGthCxxyIQ3JsG7aTygVSsJRcLUo2M6zTP+65blDqnJyatoaNcRqfUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9FA/m4qRapPj5vL8TSfRXIFFqcy60Je/jiudgQZTc4=;
 b=MPTOWHH+u0B/Hsj15RuSriO30VRydMAeoPMHOomhZg9vWqEtAdJ30Fx66kQV4vslxzzrmhFzyPi9L0dybysvMPnSuqXdnoG7NnaAm+W1MfEzD4irqYpAyRMzmaR36e6zNgUyR2ZOeUx2aH2pey+h6qlLwLSCW18AsV5UrTqksyc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3868.namprd11.prod.outlook.com (2603:10b6:5:19f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Sun, 14 Mar
 2021 00:21:56 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3912.031; Sun, 14 Mar 2021
 00:21:56 +0000
Subject: Re: [oe] [PATCH 2/2] xterm: upgrade 362 -> 366
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
 <166C0478E3069EA0.31886@lists.openembedded.org>
 <627f550c-32a8-96ef-59d3-0826d31d8c0d@windriver.com>
Message-ID: <6321d8bb-29d4-f216-927f-476e19db8986@windriver.com>
Date: Sat, 13 Mar 2021 19:21:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <627f550c-32a8-96ef-59d3-0826d31d8c0d@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR04CA0005.namprd04.prod.outlook.com (2603:10b6:a03:40::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend Transport; Sun, 14 Mar 2021 00:21:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afb2b981-7086-4f3e-2181-08d8e67f2ca8
X-MS-TrafficTypeDiagnostic: DM6PR11MB3868:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB386872E30F17636AB8BBEA72F86D9@DM6PR11MB3868.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VjXU2AMIiToNr/H+iW7NaBwdPSTspiodchagkYcNJnIjwvVGTkorqDlNS9fBSKML/TxkDXA3+PN74aXvksm0wNaCJ+SGRAweDOiFNXtpoTXxk9D0AU4/JGrDymsUpmPQoyiNmZIyd4dKD6cXTXZJhJnBIW9k5OOJwAF5oLR+ZbJBr1XTc1ih7a2SuUhq2VRgIr4EyAFVNc55YEM++/3McNhT+/BMXVgD15SEmzrqBo8sTtEXrOaegu13wB4Z4Gxl+QQO8bZEkrGQ5MXph4UjisnITLFwfyQ+t8yN9e2yWYJY/L/u/JIknwxWC6VylMFqMRAENrARwYby4dE1yexbgiiGyKIKGJZW15ZTnDV1Ds/d0ga6Yb1p93ZmscdDyYXlMOxMPQDLy9A2EiAxvNhNoRYTV2G+AvMJTjqzaWz+Lg2VntpyJjGPnCTIGq+nWMRUyUDZVLzdODyxrLvv7OkxzMIepc2sZ8G0huFONe1ekhmRo50VylVA1T+SCfpYPTPTqCytCaH6Z7q5bVmT+SAUJ/X9wUDrQy8vFMhp84IBtQwPlSMNDaxp0B86GhrfPTfGiVDeje1v6wMHo3bouLu6rbC2KQnDHfg+O0/E4Jh7aG0RpJhCVa6O2mHoLwoW8+r2UeuLdSG7cDqJMJcilUE6XeKMVFl5h5OxGhXu9D+yrC+oF3yQEMy4SLWq9y2McBp//fiuf5QTJgK7Wf/Ad3Qc3sUDz+Caut6O4teSkI4lcasTWWQFCEDpmYG4EOSBtl4TSaq1UkTCqLKyG76tD9hgWB1joiXzIeb0i+R0sLobkjI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39830400003)(66946007)(53546011)(66476007)(8936002)(8676002)(5660300002)(52116002)(66556008)(956004)(6916009)(86362001)(26005)(33964004)(2616005)(36756003)(16526019)(478600001)(31696002)(166002)(21615005)(30864003)(6666004)(16576012)(186003)(6486002)(966005)(2906002)(316002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dkVnOHczS2VUbU5LWDYvajJpb3FPanIzU3JjRVlva0FOY1VMZEl5Vk1GL2dN?=
 =?utf-8?B?cysrem9SSjBjR2tyNHBxUUxpN2RjZ1ZxbXNmVXRQVGFES2xJd2VwTFV6WUw1?=
 =?utf-8?B?MGhRNHJYQkpkaFVPWjdibDVZUi9qUjhDaWVGMy9MTDJadytVbWVuTjNLcGI1?=
 =?utf-8?B?eGFtMmZtcloyalRaSU1ENS9VSktYU294UGF2K2xUc2liTjFsY0hpT0haSmpF?=
 =?utf-8?B?ZUhVU3B1bkZoOWdRQm9tSjJjQ3BiTkFEem9lV3pwd0wzUUsvQUNWWC9DdnJv?=
 =?utf-8?B?RDg0b0NHalM0MkswMzRBWG5jMEZreW9pWVUvUDRBeGJOWndYclM0NEs5aGVZ?=
 =?utf-8?B?bkNLSDIydUJQKzMzdkdEODJySktpcHVJalNiNUFYakM5Z0pIdzVlSDFwUjJh?=
 =?utf-8?B?SW93dlNYQnhxK0hvQ1pBTmJBVFd1ckx4OG03OUxKNC9Jd3N5TG51YTRKNjNh?=
 =?utf-8?B?RVVvOFdsc1EyQUhkSm41YW12RjBqQ1FlaVp3OFVndVFmK0cyU2FDV2lESnRk?=
 =?utf-8?B?bWxQblhFa2ZEOS9zaFhYL2ZCa21XOUNQTnRZWHVsdkE2dXlTcHA3Qzd3eUxF?=
 =?utf-8?B?czloUWlYckVKTytUbTdwS0tDSHcrSFl1eHdkdGpjRWxiVHdPVWhPeDcxOEIz?=
 =?utf-8?B?NlpnZHBMZXVMYmVpcjFZcFBJakdvWFNPc2JpQzcxUnBrTElnbjdpT2pzdUhG?=
 =?utf-8?B?M3lFZHNaZi84ZFlSTHE4eEdYZjVERG0xQVBQUWhNYUlpZk5ySXdrNzNyM25t?=
 =?utf-8?B?SkRlMUZhRXBzN0NuRnVhem1DV0FmR3JwTDhieVhsYXp1WmozNFY1UkowTDJh?=
 =?utf-8?B?aHhFOXRHTmtNU2YweXRwSDdyalExL2V4T2NtbStUd1U1ZjhaeE9lNHF3RTRQ?=
 =?utf-8?B?MjhnUHdSOEdyTm5yMklRdkJOVUZNNlh1YjE2M0IrVFIvWW9rUVJIMFlnWGpn?=
 =?utf-8?B?Q0FzS2JFdXhmMk1tOHpST0ZhcDBodkFKekkvT0dsSTBrdm5OblZmUVJLeld0?=
 =?utf-8?B?S1ZVWk5CdTVjS1hCOEE1b1Z3VUZrTU9yWFlITVArZkE3a053NmVvMWpHM1o1?=
 =?utf-8?B?elJHYVQ5d1lYd0M4Z2Q4Um1pODQ4TTN1OHlVdVRrVUZvY0xGdHAzdnQvUFpJ?=
 =?utf-8?B?cHFzNkdOcHFQYWkzaUxHTUJEZWpsQlZuR2RBZXJQMkQ4enJWS1ZxV2hRQVNH?=
 =?utf-8?B?VHNvbHdseXY4dFlCeW1VMHRENi9TN3FUdUcyK1NwYjJGWmpIbVBmUklRc0ZT?=
 =?utf-8?B?U1JwWnJWUjN5WFgySDRFT0ZCY1NncDY5WSt6ajRzenJwcURjY1g1aEh0Y1ZI?=
 =?utf-8?B?UlI4NDR1UTRhWlFlclZYZ0VMNlNmUTF6TVBJTFo2aG9SZFIrMVppc3FOUzRl?=
 =?utf-8?B?UFRoTm5ZZUJXNGRGejdEUnNuTm1zNXBPY0d3UkFrSTBtUXBVai9URWN0R1gv?=
 =?utf-8?B?cEJoN3hpNlBDQ0tPaGtiOFgzOFRMSUVlY200bmdqUytwaDQwZ3h6eG8rejNq?=
 =?utf-8?B?TmY2Y1ZrUzBTcGJodXg0N0xHL0RLSjhmTlJwd3h6K3JtR3ZIODEzeFJGZFB5?=
 =?utf-8?B?eG83SUxWeEdScFBIVERKZGxpb2dUaUNTYzNFV0dMeUkvdFp6U0g2YklncGJw?=
 =?utf-8?B?aTRTNC8vWCtsV2NPajBkVTVGQysyVFkzaldyRGxvNHRpSDUvYklUcEE1RlhC?=
 =?utf-8?B?dGdQZU9TMzlTdHlMTU5hblhaMjI1Z2U2bDFBaDY3MGpQblpCTDZBLzdCcElF?=
 =?utf-8?Q?ZuE6XJTK4GpIlz6ObP7jsfbnr66IsStE3hpXRRl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb2b981-7086-4f3e-2181-08d8e67f2ca8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2021 00:21:56.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDciUGrRkJNUADFvDG0OU/HR2cyJujykbqYyIDHQxzQVr8+InnSHXEiO5dpHOA3o4/Fz2JyUxbFrS9D6ufNLdOHa0ZWXmQBC2JetODpP/Ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3868
Content-Type: multipart/alternative;
 boundary="------------001FBB3C4B74E9F2C3DB21D4"
Content-Language: en-CA

--------------001FBB3C4B74E9F2C3DB21D4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2021-03-13 4:55 p.m., Randy MacLeod wrote:
> BUILDALL-QEMU LOG FOR xterm
> START TIME: 2021-03-13_11:26:07
> HOSTNAME: ala-lpggp3
> HOST OS: Ubuntu 18.04.3 LTS
> HOST KERNEL: 5.4.0-62-generic
> ===============
> BUILD RESULTS:
> [glibc]
> PASS: qemuarmv5
> PASS: qemumips
> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> PASS: qemuarm
> PASS: qemuppc
> PASS: qemuriscv64
> PASS: qemux86
> [musl]
> PASS: qemuarmv5
> PASS: qemumips
> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> PASS: qemuarm
> PASS: qemuppc
> PASS: qemuriscv64
> PASS: qemux86
> ===============
> PASSED: 18
> FAILED: 0
>
>
>
> root@qemux86-64:~# xterm -h | head
> XTerm(366) usage:
>     xterm [-options ...] [-e command args]
>
> where options include:
>     -/+132                       turn on/off 80/132 column switching
>     -C                           intercept console messages
>     -Sccn                        slave mode on "ttycc", file 
> descriptor "n"
>     -T string                    title name for window
>     -/+ah                        turn on/off always highlight
>     -/+ai                        turn off/on active icon
> root@qemux86-64:~#
>

Oh and FYI here is the summary of changes from:
    https://invisible-island.net/xterm/xterm.log.html


    Patch #366 - 2021/02/10

  * correct a compiler-warning fix in patch #352
    <https://invisible-island.net/xterm/xterm.log.html#xterm_352> which
    allowed sign-extension of coordinate values (report by "CismonX").
  * correct upper-limit for selection buffer, accounting for combining
    characters (report/testcase by Tavis Ormandy).
  * with |alwaysHighlight| true, xterm does not properly track focus.
    The /screen->select/ |FOCUS| flag remains always on, which prevents
    |bellIsUrgent| from working, as the urgent |WM_HINT| flag is only
    set in |setXUrgency()| when the window is not focused. Fix this by
    updating /screen->select/ in |unselectwindow()| regardless of the
    value of |always_highlight| (patch by Jiri Bohac).
  * improve fix for interaction between SRM and ENQ (report by Grant
    Taylor).
  * build-fix for |--with-Xaw3dxft|, needed when |--with-toolbar| is
    omitted (report by Jimmy Olgeni, Emanuel Haupt).


    Patch #365 - 2021/02/03

  * amend fix for “word” selection in patch #364
    <https://invisible-island.net/xterm/xterm.log.html#xterm_364> to
    limit that to the |insert-selectable| /action/, which reads data
    from the screen. This restores the interactive behavior where
    double-clicking on a “word” would make subsequent selection
    extensions by words as well as suppressing some boundary-checks
    (report by David Wolfskill, FreeBSD #253225
    <http://www.freebsd.org/cgi/query-pr.cgi?pr=253225>).


    Patch #364 - 2021/02/02

  * add |-fc| option.
  * correct/improve limit-checks for SRM versus ENQ from patch #344
    <https://invisible-island.net/xterm/xterm.log.html#xterm_344>
    (report by Tom Szilagyi).
  * enable |XftFont| resource in Xaw3dxft configuration (patch by Tavis
    Ormandy).
  * improve quoting/escaping in build-scripts per shellcheck.
  * add |libpcre2-posix| to the packages tested for |--with-pcre2|
    option, needed with Fedora (report by Tomas Korbar).
  * correct a typo in manual page, and note that |KeepClipboard| may not
    be compiled-in (report/patch by Sean C Farley).
  * corrected boundary-checks for “word” selection used in |on/N/Clicks|
    resources (report by Tavis Ormandy).
  * update to autoconf-2.52-20210101, to improve shellcheck warnings.
  * improve configure check for desktop categories.


    Patch #363 - 2020/12/26

  * disable groff hyphenation in generated html when using man2html.
  * change SCS “|&4|” Cyrillic to non-NRCS, per VT520 manual.
  * amend fix for SCS in patch #198
    <https://invisible-island.net/xterm/xterm.log.html#xterm_198> to
    remove |DEL| rather than converting it to a space (report by Thomas
    Wolff).
  * modify state transitions for selecting character sets to eliminate
    an ambiguity between the “A” used in VT220 versus VT320.
  * improve error recovery when selecting characters by resetting to US
    ASCII when no suitable encoding is found, e.g., attempting to use an
    NRCS sequence when NRCS is not enabled.
  * turn off hyphenation in “|.txt|” conversion, prompted by groff changes.
  * add VT5xx ISO Latin-2 (prompted by discussion with Thomas Wolff).
  * amend change from patch #361
    <https://invisible-island.net/xterm/xterm.log.html#xterm_361> to
    event-handling in |CopyWait| to handle active-icon as a special case
    (Debian #975687
    <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=975687>).
  * add call to |loadColorTable| to get the visual information needed to
    decode BE RGBA32 color format (patch by Leandro Lupori).
  * modify the resource-parsing for |disallowedPasteControls| and
    similar lists of names/numbers to recognize “~;” (tilde) for
    cancelling a given name/number.
  * add ENQ, EOT and NUL to default for |disallowedPasteControls|.
  * change default for |disallowedPasteControls| to omit the tab
    character (suggested by Harald Dunkel).
  * fix swapped height/width in |regisScreenSize| and |maxGraphicSize|
    resources using "auto" value, from patch #314
    <https://invisible-island.net/xterm/xterm.log.html#xterm_314>
    (report by Anton Lavrentiev)
  * revise patch #362
    <https://invisible-island.net/xterm/xterm.log.html#xterm_362> change
    for shift-modifier versus mouse protocol and select/paste by adding
    resource |shiftEscape|, which can be enabled via a control sequence
    (prompted by discussion with Matthijs van Duin).
  * simplify/improve ifdef in trace code for using a separate set of
    files for each run of xterm.
  * add options |-r| and |-t| to |vttests/query-color.pl| to show the
    6-digit RGB code and actual colors.
  * add |nel| to |xterm-basic| terminfo.
  * alter |vttests/modify-keys.pl| to omit HTML reference links to the
    modified-keys table where no keycode was available.

-- 
# Randy MacLeod
# Wind River Linux


--------------001FBB3C4B74E9F2C3DB21D4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2021-03-13 4:55 p.m., Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:627f550c-32a8-96ef-59d3-0826d31d8c0d@windriver.com">BUILDALL-QEMU
      LOG FOR xterm
      <br>
      START TIME: 2021-03-13_11:26:07
      <br>
      HOSTNAME: ala-lpggp3
      <br>
      HOST OS: Ubuntu 18.04.3 LTS
      <br>
      HOST KERNEL: 5.4.0-62-generic
      <br>
      ===============
      <br>
      BUILD RESULTS:
      <br>
      [glibc]
      <br>
      PASS: qemuarmv5
      <br>
      PASS: qemumips
      <br>
      PASS: qemux86-64
      <br>
      PASS: qemuarm64
      <br>
      PASS: qemumips64
      <br>
      PASS: qemuarm
      <br>
      PASS: qemuppc
      <br>
      PASS: qemuriscv64
      <br>
      PASS: qemux86
      <br>
      [musl]
      <br>
      PASS: qemuarmv5
      <br>
      PASS: qemumips
      <br>
      PASS: qemux86-64
      <br>
      PASS: qemuarm64
      <br>
      PASS: qemumips64
      <br>
      PASS: qemuarm
      <br>
      PASS: qemuppc
      <br>
      PASS: qemuriscv64
      <br>
      PASS: qemux86
      <br>
      ===============
      <br>
      PASSED: 18
      <br>
      FAILED: 0
      <br>
      <br>
      <br>
      <br>
      root@qemux86-64:~# xterm -h | head
      <br>
      XTerm(366) usage:
      <br>
      &nbsp;&nbsp;&nbsp; xterm [-options ...] [-e command args]
      <br>
      <br>
      where options include:
      <br>
      &nbsp;&nbsp;&nbsp; -/+132&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; turn on/off 80/132 column
      switching
      <br>
      &nbsp;&nbsp;&nbsp; -C&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; intercept console messages
      <br>
      &nbsp;&nbsp;&nbsp; -Sccn&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slave mode on &quot;ttycc&quot;, file
      descriptor &quot;n&quot;
      <br>
      &nbsp;&nbsp;&nbsp; -T string&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title name for window
      <br>
      &nbsp;&nbsp;&nbsp; -/+ah&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; turn on/off always highlight
      <br>
      &nbsp;&nbsp;&nbsp; -/+ai&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; turn off/on active icon
      <br>
      root@qemux86-64:~#
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Oh and FYI here is the summary of changes from:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://invisible-island.net/xterm/xterm.log.html">https://invisible-island.net/xterm/xterm.log.html</a></p>
    <h2><a name="xterm_366" id="xterm_366">Patch #366 - 2021/02/10</a></h2>
    <ul>
      <li>correct a compiler-warning fix in <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_352">patch
          #352</a> which allowed sign-extension of coordinate values
        (report by &quot;CismonX&quot;).</li>
      <li>correct upper-limit for selection buffer, accounting for
        combining characters (report/testcase by Tavis Ormandy).</li>
      <li>with <code>alwaysHighlight</code> true, xterm does not
        properly track focus. The <em>screen-&gt;select</em> <code>FOCUS</code>
        flag remains always on, which prevents <code>bellIsUrgent</code>
        from working, as the urgent <code>WM_HINT</code> flag is only
        set in <code>setXUrgency()</code> when the window is not
        focused. Fix this by updating <em>screen-&gt;select</em> in <code>unselectwindow()</code>
        regardless of the value of <code>always_highlight</code> (patch
        by Jiri Bohac).</li>
      <li>improve fix for interaction between SRM and ENQ (report by
        Grant Taylor).</li>
      <li>build-fix for <code>--with-Xaw3dxft</code>, needed when <code>--with-toolbar</code>
        is omitted (report by Jimmy Olgeni, Emanuel Haupt).</li>
    </ul>
    <h2><a name="xterm_365" id="xterm_365">Patch #365 - 2021/02/03</a></h2>
    <ul>
      <li>amend fix for “word” selection in <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_364">patch
          #364</a> to limit that to the <code>insert-selectable</code>
        <em>action</em>, which reads data from the screen. This restores
        the interactive behavior where double-clicking on a “word” would
        make subsequent selection extensions by words as well as
        suppressing some boundary-checks (report by David Wolfskill,
        FreeBSD <a href="http://www.freebsd.org/cgi/query-pr.cgi?pr=253225">#253225</a>).</li>
    </ul>
    <h2><a name="xterm_364" id="xterm_364">Patch #364 - 2021/02/02</a></h2>
    <ul>
      <li>add <code>-fc</code> option.</li>
      <li>correct/improve limit-checks for SRM versus ENQ from <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_344">patch
          #344</a> (report by Tom Szilagyi).</li>
      <li>enable <code>XftFont</code> resource in Xaw3dxft
        configuration (patch by Tavis Ormandy).</li>
      <li>improve quoting/escaping in build-scripts per shellcheck.</li>
      <li>add <code>libpcre2-posix</code> to the packages tested for <code>--with-pcre2</code>
        option, needed with Fedora (report by Tomas Korbar).</li>
      <li>correct a typo in manual page, and note that <code>KeepClipboard</code>
        may not be compiled-in (report/patch by Sean C Farley).</li>
      <li>corrected boundary-checks for “word” selection used in <code>on<em>N</em>Clicks</code>
        resources (report by Tavis Ormandy).</li>
      <li>update to autoconf-2.52-20210101, to improve shellcheck
        warnings.</li>
      <li>improve configure check for desktop categories.</li>
    </ul>
    <h2><a name="xterm_363" id="xterm_363">Patch #363 - 2020/12/26</a></h2>
    <ul>
      <li>disable groff hyphenation in generated html when using
        man2html.</li>
      <li>change SCS “<code>&amp;4</code>” Cyrillic to non-NRCS, per
        VT520 manual.</li>
      <li>amend fix for SCS in <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_198">patch
          #198</a> to remove <code>DEL</code> rather than converting it
        to a space (report by Thomas Wolff).</li>
      <li>modify state transitions for selecting character sets to
        eliminate an ambiguity between the “A” used in VT220 versus
        VT320.</li>
      <li>improve error recovery when selecting characters by resetting
        to US ASCII when no suitable encoding is found, e.g., attempting
        to use an NRCS sequence when NRCS is not enabled.</li>
      <li>turn off hyphenation in “<code>.txt</code>” conversion,
        prompted by groff changes.</li>
      <li>add VT5xx ISO Latin-2 (prompted by discussion with Thomas
        Wolff).</li>
      <li>amend change from <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_361">patch
          #361</a> to event-handling in <code>CopyWait</code> to handle
        active-icon as a special case (Debian <a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=975687">#975687</a>).</li>
      <li>add call to <code>loadColorTable</code> to get the visual
        information needed to decode BE RGBA32 color format (patch by
        Leandro Lupori).</li>
      <li>modify the resource-parsing for <code>disallowedPasteControls</code>
        and similar lists of names/numbers to recognize “~;” (tilde) for
        cancelling a given name/number.</li>
      <li>add ENQ, EOT and NUL to default for <code>disallowedPasteControls</code>.</li>
      <li>change default for <code>disallowedPasteControls</code> to
        omit the tab character (suggested by Harald Dunkel).</li>
      <li>fix swapped height/width in <code>regisScreenSize</code> and
        <code>maxGraphicSize</code> resources using &quot;auto&quot; value, from <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_314">patch
          #314</a> (report by Anton Lavrentiev)</li>
      <li>revise <a href="https://invisible-island.net/xterm/xterm.log.html#xterm_362">patch
          #362</a> change for shift-modifier versus mouse protocol and
        select/paste by adding resource <code>shiftEscape</code>, which
        can be enabled via a control sequence (prompted by discussion
        with Matthijs van Duin).</li>
      <li>simplify/improve ifdef in trace code for using a separate set
        of files for each run of xterm.</li>
      <li>add options <code>-r</code> and <code>-t</code> to <code>vttests/query-color.pl</code>
        to show the 6-digit RGB code and actual colors.</li>
      <li>add <code>nel</code> to <code>xterm-basic</code> terminfo.</li>
      <li>alter <code>vttests/modify-keys.pl</code> to omit HTML
        reference links to the modified-keys table where no keycode was
        available.</li>
    </ul>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------001FBB3C4B74E9F2C3DB21D4--
