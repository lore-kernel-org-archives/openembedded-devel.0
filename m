Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12744.1792777455149040112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TxgF/rRi;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b001cd92bso660935f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777453; x=1793382253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAncG5J19jEmltudpkVZXa81ZAoL2BzMliHb+CXtflc=;
        b=TxgF/rRi4wVFQcfo3Q36nUpiOEoazqEsaGfiqzWqX0mcj56kv+rkD1fNyfT4zeRqmh
         dRjIpIlHYbhnvUTBQ/Z8YMS0SRB7WoNW1zVE8Rl6QFWR7dM5/makTaKX9mr3esILCYmP
         lUFyzwqCPOoun1ZYLZIpyD0s2WQxPifmSsXOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777453; x=1793382253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAncG5J19jEmltudpkVZXa81ZAoL2BzMliHb+CXtflc=;
        b=QQllR3oMjCWWlyF6BHmopwO8YS8yUOVMdMfyQfvTKGk48GxMMCsn0Bke4+Jv7lkjmi
         pspkGwlyQ6fgAScRhBZNuGC08DzZMQ54ex/+McKjk7w+CgBJZPNGKlKyLDWRR3pY25ZR
         jEz8zcmB78Okw9eXyU54OflHp3PdRoGYRgbDBKo00FyVi1yz1uiD4XIJcaq0ZF6AyFky
         o+4fWrPM1AmREU4nkerKvOxxv+egJa/6iH9YI4OHj1QPlaKLhA2cw8I8CvzfrOw+owLc
         cWGQOuVEtMkhU8/iuZAAoTtsbolCHxQeKPm0ubkRvOb18cPLMYMfWydNdWm3E7AyB27o
         dxmQ==
X-Gm-Message-State: AFq9FYImZ+YY4VfNmY70nRNYHrJR29RU1wpo/pJcbTvzz5kchd/65dI+
	8FUy03sGxdh1IodcgWiUBE38U199lH12HKZDTgtEkgkzalEJaSt4lHspaEmfR7G7U8sdh5OE2mS
	zZlHV
X-Gm-Gg: AYBFou2I3AfAhevBd3/aZtdbKlXzfMANdB+fgO9cst5HwkW0oFLYnsGJAqG8DHQ8sER
	xfgrJwlmUU1L8Bo0SJL7Xu4uToHTtlThNqDusLk+gKUQ8geWKvsAuuvOYf8yVQvTiQrJ2ky4MKU
	oY0I5B+HnziFl2yvX99qlECzyXf3cReMMUmH0/jKDJSYoJlJWNFhEMA8sIWHwS1wdvwvZv9El7A
	etk47KfpxV0dtCJErMnONVrjsW5QgqccdsiA1mC6VvYxITSYE39BzzXYAWwiLOavQZAAIc/uToz
	sXc4/J1Qkuug/m3GJIRT9KFZCJRkbovRtMRoyPpk+ZUjxkKDaPC8D27jc2MtdgFR5goW4Loy8uc
	r8wy9145Uv6HwI08XE9UuqpwCPvfDqgTA1Q1vOg9yjLtoVZ5SDL4DNxYXbXAAzZ6B/XF28rhweb
	PoFfTEtdbI3Z2RLix7kVw2DgmSsZaY8ZVgwYQ7AyjZP7lJQh+TDbZ8kFCez+JCy20apxehKrT7k
	TmWRpNL6PF11H0qOPxfZMAc8nXeUXRboEiIQ3/8BY37v+/1vZuIRuQQ6FVyDX12E9oFypZS/9wT
	OAepJ9zdvYs8KVXZKartv/8NHjTmSwfCnMobvmHuNNDvpoEtBP/yGk1DwpLe4OS2HziYA1kYd39
	iMjO5
X-Received: by 2002:a05:6000:1a8c:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-48e3df8750emr447816f8f.6.1792777452933;
        Fri, 23 Oct 2026 10:44:12 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 9/9] python3-nltk: Upgrade 3.10.3 -> 3.10.4
Date: Fri, 23 Oct 2026 20:44:01 +0300
Message-ID: <20261023174401.3617912-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131388
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.10.4:

This release routes every file path, archive, download, URL fetch and
external program through one sandbox that keeps reads and writes inside
the trusted data directories, refuses path traversal, symlink escapes
and decompression bombs, blocks requests to internal network addresses,
and runs Java and other third-party tools only from trusted absolute
locations with validated options and input. Pickled models now load
through a restricted unpickler, XML and JSON parsing are hardened, and
regular expressions, recursion and slow algorithms in the tokenizers,
parsers, stemmers and corpus readers are bounded against
denial-of-service input. Text that NLTK writes to the terminal, to CSV
files, to the WordNet browser and to third-party tool input is sanitized
against injection.

Security changes you may notice

Every refusal below raises with a message that starts with "Security
Violation" and names the check, so a failure is easy to search for (PR

- Data directories (nltk.pathsec, nltk.data): corpora, models and
  every other resource are read and written only inside the
  directories listed in nltk.data.path. A path that leaves a data
  root, a symlink that points out of one, and a NUL byte or encoded
  traversal in a resource name are refused. A data root, or a
  directory on the way to a resource, that another account can
  write to is skipped with a warning naming the directory and the
  remedy. Keep private data in a private directory and add it to
  nltk.data.path; /tmp is not a data root. Model save and load
  methods (perceptron, maxent, named-entity chunker, Weka, crf,
  hunpos, Stanford) accept destinations inside a data root only (PR
  #3797, #3753, #3850, #3761, #3755, #3759, #3760, #3763, #3806,
  #3807, #3808, #3809, #3813, #3814, #3815, #3848, #3851, #3852,
  #3853, #3863, #3871, #3888, #3945, #3961, #3969, #3981)
- Downloader: downloaded package archives stay private to the
  installing account (0600). An install another account must read
  is extracted: a download made as root or outside the installing
  account's home extracts on its own, and nltk.download(...,
  extract=True) / python -m nltk.downloader --extract (or
  --no-extract) decide explicitly. This also unpacks the packages
  the index leaves zipped (wordnet, omw-1.4 ...); the extracted
  files are readable by every account and are found before the
  archive. find() names an archive it cannot read and says how to
  extract it instead of reporting it "not found". The downloader
  installs only into directories no other account can write to,
  treats an archive another account owns or can write to as stale
  and downloads it afresh, extracts only from an archive no other
  account could have changed since its checksum was verified,
  bounds the size of what it fetches, and refuses index entries and
  archive members that would write outside the package directory
  (PR #3929, #3804, #3850, #3778)
- Pickles: nltk.data.load(..., format="pickle") reconstructs plain
  data only; a pickle that names any class or function is refused.
  Model loaders that need classes use an explicit allowlist of
  audited globals, so a gadget such as os.system can never be
  reconstructed from a model file. chat80 shelve values load the
  same way (PR #3794, #3754, #3757, #3802, #3817, #3823, #3824)
- XML, JSON and YAML: nltk.xmlsec refuses any document that
  declares an entity or references an external one (billion-laughs,
  external-entity and DTD attacks) and bounds the tree depth, and
  every corpus XML view, the downloader index, Toolbox and
  internals parse through it. JSON resources load with a depth and
  size bound; YAML (the markdown corpus front matter and
  nltk.data.load(..., format="yaml")) loads through a bounded safe
  loader. Oversized or too deeply nested input raises ValueError
  naming the limit (PR #3754, #3805, #3828, #3933, #3972, #3974)
- Regular expressions (nltk.redos): every regular expression NLTK
  compiles, including one you pass to RegexpTokenizer,
  RegexpStemmer, RegexpParser, re_show, TokenSearcher.findall,
  tgrep, nltk.help tag-set lookups and the concordance and nemo
  GUIs, now goes through nltk.redos on the regex engine. A pattern
  longer than 100,000 characters, nested more than 100 deep, with
  more than 1,000 capturing groups or an excessive repetition
  product is refused with nltk.redos.error, a subclass of re.error;
  a match that runs longer than nltk.redos.DEFAULT_TIMEOUT (5
  seconds) raises TimeoutError instead of hanging. Patterns keep re
  syntax; match objects are the regex engine's (PR #3825, #3829,
  #3830, #3831, #3832, #3833, #3834, #3835, #3836, #3837, #3838,
  #3839, #3840, #3841, #3842, #3843, #3844, #3845, #3846, #3796,
  #3801, #3906, #3907, #3908, #3910)
- Regular expressions made linear: the leading-run and re-anchoring
  patterns that a timeout cannot catch were rewritten or bounded in
  the word, Treebank, blankline, TextTiling, toktok and syllable
  tokenizers, the readline of corpus streams, the CoNLL SRL, TIMIT,
  senseval, pl196x, NKJP, Alpino, YCOE, IEER, ACE, VerbNet, reviews
  and Lin readers, relextract, the valuation parser, the CCG
  lexicon parser, dependency grammars and chomsky_normal_form, each
  verified on the real corpus (PR #3947, #3934, #3932, #3938,
  #3935, #3933, #3869, #3944, #3911, #3909, #3953, #3895)
- Size, depth and time bounds: trees deeper than
  nltk.tree.MAX_TREE_DEPTH (500), WordNet and other relation walks
  deeper than nltk.util.MAX_RECURSION_DEPTH (500), tgrep deeper
  than 50, Toolbox deeper than 500, dependency graphs deeper than
  200, are refused with ValueError naming the limit rather than
  exhausting the stack, and the stemmers, distance metrics,
  skipgrams, parsers and grammar transforms run in linear or
  bounded time with identical output for legitimate input.
  chart_parse stops after nltk.parse.chart.DEFAULT_MAX_TIME (5
  seconds of wall-clock, needed only for feature grammars;
  max_time=None disables it). Tree.__repr__ no longer recurses, so
  a deep accepted tree prints (PR #3827, #3885, #3895, #3767,
  #3784, #3917, #3958, #3960, #3977)
- External tools and Java: a tool binary is resolved from an
  absolute path or a trusted search path only, never from the
  current directory; the binary, its directory and the model and
  data files handed to it must not be writable by another account
  (symlinked and multi-call executables such as a packaged Graphviz
  dot are supported). java() accepts a main class as the first
  argument only (no -jar, @argfile or .java source file), validates
  its options against an allowlist, and loads jars only from a data
  root unless NLTK_ALLOW_UNSAFE_JARS=1 opts out with a warning.
  CoreNLP server options are allowlisted. Stanford, Malt, Senna,
  hunpos, Prover9, megam, TADM, Weka and crf wrappers validate
  their paths and the text they pipe to the tool against line and
  argument injection (PR #3772, #3771, #3975, #3743, #3782, #3788,
  #3768, #3798, #3887, #3858, #3950, #3951, #3812, #3816, #3868,
  #3894, #3941, #3850, #3925)
- Network: the downloader, nltk.data.load of a URL and the CHILDES
  reader fetch through pathsec.urlopen, which refuses addresses
  that are not globally routable (loopback, private, link-local and
  multicast, including tunnelled and obfuscated forms), pins the
  validated address for the connection, allows file:// with a local
  authority only, and refuses a proxied fetch unless
  NLTK_ALLOW_PROXIED_URLOPEN=1 (or nltk.pathsec.ALLOW_PROXIED_FETCH
  = True) asserts the proxy is trusted. The CoreNLP client talks to
  its local server with requests and is not affected (PR #3847,
  #3810, #3750, #3850)
- Terminal, CSV, DOT and HTML output: every print in the library
  goes through nltk.termsec.safe_print, which renders control
  characters, escape sequences and unbalanced bidi overrides from
  corpus text as visible \xNN escapes instead of letting them reach
  the terminal. The CSV files the twitter and sentiment helpers
  write neutralise formula-leading and control-sequence cells,
  AlignedSent DOT labels are escaped, the WordNet browser escapes
  corpus text, and nltk.data.load's verbose output no longer prints
  the full resource URL (PR #3914, #3915, #3937, #3946, #3931,
  #3930, #3856, #3902)
- Corpus stores and encodings: the PanLex Lite and chat80 sqlite
  stores open read-only on a pinned descriptor with their schema
  screened and a statement step budget, chat80 shelves are read by
  a key manifest, Toolbox SFM markers are sanitised, and a resource
  encoding that is not a text codec (bz2_codec and friends) is
  refused (PR #3961, #3964, #3959, #3888, #3800, #3962)
- Package contents: the wheel no longer ships nltk.test.unit (the
  attack harnesses, advisory probes and their fixtures), so pip
  install nltk is about half the size and import nltk.test.unit
  works from a source checkout or the sdist only. The doctests
  under nltk.test still ship (PR #3954)

Security test and CI infrastructure

- Attack and regression harnesses, advisory probes, the sandbox
  conftest fixtures, the pre-commit guards (no unsandboxed open,
  every regex through redos, every pickle through picklesec, every
  print through safe_print), load-invariant CPU-time timing rules,
  CI matrix and runner fixes, pinned third-party downloads, and the
  AUTHORS update (PR #3744, #3749, #3762, #3764, #3770, #3776,
  #3791, #3795, #3803, #3818, #3820, #3821, #3822, #3849, #3855,
  #3860, #3861, #3862, #3864, #3865, #3866, #3876, #3884, #3899,
  #3904, #3905, #3912, #3917, #3924, #3926, #3927, #3939, #3940,
  #3943, #3948, #3949, #3963, #3968, #3971, #3976, #3982, #3983,
  #3984, #3985)

Other changes

- Added RTL language syntactic tree visualization support (PR
  #3472)
- Fix #3394: Ensure punkt_tab is downloaded when punkt is requested
  (PR #3505)
- Show README.md as the PyPI long description (PR #3746)
- Add stopwords.words("english-extended") (PR #3747)
- Krippendorff's alpha: treat placeholder labels as missing data
  (#2865, #2732) (PR #3752)
- Fix shared defaults in chat80 Concept (PR #3773)
- Fix Java wrappers decoding str output from java()
  (universal_newlines) (PR #3777)
- Prevent IndexError in Hungarian stemmer on empty string (PR
  #3785)
- Isolate MTE tag filters per view (PR #3792)
- Fix newline in ellipsis tokens in TweetTokenizer (PR #3819)
- Isolate default WordNet reference relations (PR #3872)
- Fix resolution paths that cancel distinct literals (PR #3878)
- Fix UTF-8 text preprocessing in NKJP corpus reader (PR #3879)
- Remove shadowed FeatStruct._walk stub and preserve its docstring
  (PR #3893)
- Count all increasing pairs in RIBES kendall_tau (PR #3900)
- Fix the TweetTokenizer ZWJ emoji pattern capturing adjacent
  whitespace (PR #3913)
- Surface the CoreNLP server's reason for a non-2xx answer (PR
  #3942)
- Omit unaligned (NULL target) pairs from Alignment strings, so IBM
  model output prints (PR #3967)
- Fix DependencyGraph cycle detection, which returned False on
  every parsed graph (PR #3978)
- Show, range and draw an alignment with an unaligned pair on every
  surface (PR #3987)

What's Changed:

- Show README.md as the PyPI long description
- Add stopwords.words("english-extended")
- Fix pathsec.urlopen treating NO_PROXY as a configured proxy
  (#3748)
- Krippendorff's alpha: treat placeholder labels as missing data
  (#2865, #2732)
- Harden core security modules: pathsec URL-scheme bypass,
  picklesec denylist, xmlsec parse()
- Add a living per-advisory security-probe harness
- Harden tokenize file I/O against path traversal (punkt,
  stanford_segmenter)
- Add a shared pathsec sandbox conftest fixture
- Contain CorpusReader / agreement / chat80 file I/O in the pathsec
  sandbox
- Write parse demo/profile output to a private staging dir, not
  /tmp or the CWD
- Add pathsec regression tests for sem.util / xmlsec / dataset
  loaders
- Harden maxent / named-entity model-artifact saves against
  shared-tmp planting
- Route weka ARFF_Formatter.write through the pathsec sandbox
- Harden untrusted-model pickle allowlist (exact globals +
  numpy.lib denylist)
- Split nltk_data pickle-asset regression into always-on and
  skippable tests
- Reject Java launcher switches and @argfiles in the java() cmd
  argument (CWE-88)
- Prevent infinite loop from cyclic collection indices
- Fix ARFF label injection in Weka classifier
- Stabilize multiprocessing test timeouts and context handling
- Fix Java wrappers decoding str output from java()
  (universal_newlines)
- Fix shared defaults in chat80 Concept
- Harden internals.java() (CWE-88): options, classpath, env,
  discovery; route MaltParser through it
- Bound decompression entry points in nltk (zip/gzip layers +
  pathsec.ZipFile + weka), CWE-409
- Restore pre-commit formatting and register the new probe id on
  develop
- Harden pickle deserialization (picklesec) against
  arbitrary-code-execution gadgets
- Fix internals.doctest to match the hardened
  _validate_java_options allowlist
- Bound re_show's caller-supplied regex against ReDoS (CWE-1333)
- Refuse CWD-relative matches for bare names in find_file/find_dir
  (CWE-427)
- Bound RegexpStemmer's caller-supplied pattern against ReDoS
- Deserialize chat80 shelve values through the restricted unpickler
  (RCE fix)
- Harden path/resource/tool validation in nltk.pathsec
- Harden downloader Package attributes and extraction against
  traversal/Zip-Slip
- Harden nltk.xmlsec.parse: read filename sources through
  pathsec.open
- Validate the NE chunker save_params destination through the
  tool-directory guard
- Pin maxent scratch files to a data root and validate scratch IO
- Add staging_tempdir and tighten data.py zip/staging guards
- Stage boxer scratch input inside an nltk.data root
- Canonicalize obfuscated numeric IPv4 in the SSRF guard (CWE-918)
- Harden the VERSION read in nltk package init with
  pathsec.open_package_resource
- Harden stanford tokenizer/segmenter wrappers: validate jar/model
  paths and argv
- Harden tagger model loads and tool paths
  (perceptron/crf/hunpos/stanford)
- Stage weka scratch files in a data root and validate the WEKAHOME
  jar path
- Route corpus-reader scratch tempfiles through a data root and
  label framenet path refusals
- Harden malt and stanford parser wrappers: validate
  binary/model/IO paths and argv
- Harden nltk.tbl.demo model load/save through picklesec and
  pathsec
- Add tests covering already-merged pathsec/security guards
- Fix develop CI: register data roots for benign save/IO tests
  broken by pathsec hardening
- Prevent combinatorial DoS in skipgrams
- Prevent IndexError in Hungarian stemmer on empty string
- Sanitize SFM markers in ToolboxData
- Isolate MTE tag filters per view
- Prevent classpath shadowing in GenericStanfordParser
- Prevent batch-boundary injection in StanfordParser
- Add remaining GHSA-8mgp security regression tests
  (pathsec/java/redos/archive/corpus)
- Add redos.source_of/reharden and picklesec.harden_object_graph
- Load nltk.tbl.demo models through an allowlisting unpickler
- Bound algorithmic-complexity (time) DoS in stemmers, metrics,
  parsers (CWE-407 / CWE-770)
- Bound regex compilation against a compile-time DoS
- Route top-level nltk regexes through nltk.redos
  (CWE-1333/CWE-400)
- Route nltk.sentiment regexes through nltk.redos
  (CWE-1333/CWE-400)
- Route nltk.chat regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.corpus regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.parse regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.draw regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.stem regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.translate regexes through nltk.redos
  (CWE-1333/CWE-400)
- Route nltk.sem regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.tree regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.tokenize regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.chunk regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.classify regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.tag regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.app regexes through nltk.redos (CWE-1333/CWE-400)
- Route nltk.ccg regexes through nltk.redos (CWE-1333/CWE-400)
- Bound compile-time DoS (ValueError) in the concordance and nemo
  GUI regex handlers (CWE-1333/CWE-400)
- Harden RegexpStemmer against pre-compiled ReDoS patterns
  (CWE-1333)
- Add security regression tests + harden SSRF filter (transition
  tunnels, IP literals)
- Strengthen the advisory security-probe harness (guards already on
  develop)
- Guard model-artifact loaders against un-sandboxed open()
- Route security-test fixtures through the pathsec I/O helpers
- Stage REPP scratch input in an nltk.data root instead of the
  shared system temp
- Bound JSON deserialization against deep-nesting crash and
  resource DoS
- Fix newline in ellipsis tokens in TweetTokenizer
- Refuse NUL bytes in pathsec.validate_path; add a pathsec
  attack-candidate harness
- Re-check the normalized form of a no-protocol resource path
  against traversal (CWE-22)
- Add and expand security / ReDoS attack test coverage
- Escape corpus-derived text in the WordNet browser app (CWE-79
  XSS)
- Add test-only regression coverage for already-fixed CWEs
- Extend the no-unsandboxed-open guard to app/draw/twitter and
  route every open through pathsec.open
- Add the all-regex-through-redos pre-commit guard and two
  regression tests
- Exclude pytest's ephemeral basetemp from the pickle-asset scanner
- Open operator-chosen app/twitter paths with an annotated builtin
  open, not pathsec.open
- Bound the WekaClassifier model path to the pathsec data roots
- Tidy transitionparser security comments to one point per <=3
  lines
- Deflake anti-DoS timing tests and harden senseval _fixXML
  leading-run ReDoS
- Harden and standardize NLTK's external-tool wrappers on a pathsec
  trusted-spawn API (CWE-426/427/732/93/88)
- Don't miscount a python-crfsuite Windows failure as a pathsec
  over-block (tag sweep)
- Give every pathsec refusal the standard Security Violation marker
  (spawn_trusted + ZIP audit)
- Bound recursion depth in parsers and traversal helpers
- Isolate default WordNet reference relations
- Harden and complete the CoreNLP server-option allowlist
  (CWE-88/22/502)
- Optimize CI test matrix
- Harden CoreNLPServer start attempts
- Make DoS/ReDoS timing regression tests load-invariant (fix CI
  flakiness)
- Extend no-unsandboxed-open guard to
  gzip/bz2/lzma/zipfile/tempfile (+ coverage test)
- Count all increasing pairs in RIBES kendall_tau
- Potential fix for code scanning alert no. 28: Clear-text logging
  of sensitive information
- Remove shadowed FeatStruct._walk stub and preserve its docstring
- Fix resolution paths that cancel distinct literals
- Add GHSA-j456 live probe; expand the GHSA-8mgp probe attack set
- Handle the redos MAX_PATTERN_LENGTH refusal in
  help._format_tagset
- Handle the redos MAX_PATTERN_LENGTH refusal in
  TokenSearcher.findall
- Handle the redos MAX_PATTERN_LENGTH refusal for a tgrep /regex/
  node literal
- Make help._format_tagset fail closed on an oversized tag pattern
  (fix develop CI)
- Add nltk.termsec terminal-output sanitizer with attack-matrix
  tests
- [WIP] Fix quadratic DoS in Tree.chomsky_normal_form right-factor
  binarization (GHSA-r53h-rw34-8h97)
- Bound SyllableTokenizer fallback-vowel accumulation (CWE-400 /
  CWE-407)
- Fix develop CI on Python 3.10/3.11: let deepcopy reach
  MAX_TREE_DEPTH
- Fix the XMLCorpusView ReDoS-test Windows CI flake (in-process op
  timing + Windows autoload)
- Route every library print through the nltk.termsec.safe_print
  chokepoint
- Log the perceptron training progress on the module logger (fixes
  the develop 3.10/3.11 cells)
- Resolve every executed tool binary absolute-only: prover9/mace4,
  megam, tadm, java, hunpos (untrusted search path, CWE-426/427)
- Pin the GHSA-cc5r-64rf-75hg proof of concept end to end and run
  its sink as probe phase 6 (follow-up to #3887)
- Validate chat80.sql_query dbname for path containment (CWE-59/73)
- Extend the tool model-file guards to crf, stanford tagger and
  segmenter
- Consolidate the internals, downloader, pathsec and decorators
  guards from #3753 and #3850
- Consolidate the nltk/parse guards from #3753 and #3850 and judge
  their inputs on real characters
- Sanitise the CSV cells and report lines the sentiment helpers
  write
- Read a long line in linear time in
  SeekableUnicodeStreamReader.readline (GHSA-j8g8)
- Escape AlignedSent DOT labels, refuse NUL, and keep the alignment
  checks under -O
- Align quote tokens in linear time in the Treebank and NLTK word
  tokenizers
- Never leave the pop of an escaped bidi override live in
  sanitize_terminal
- Find readline's line boundary with str.splitlines, not a timed
  regex
- Walk semi-relations once in relextract, and keep a pattern's
  flags in redos.reharden
- Fix UTF-8 text preprocessing in NKJP corpus reader
- Make the CoNLL SRL, TIMIT and XML view readers linear, and parse
  corpus XML through xmlsec (GHSA-v8f3)
- Measure probe scaling in process CPU time so a loaded runner
  cannot flip a verdict
- ci(deps): bump dorny/paths-filter from 3 to 4 in the
  github-actions group[bot] in
  https://github.com/nltk/nltk/pull/3943
- Surface the CoreNLP server's reason for a non-2xx answer and warm
  the live test server
- Guard the Stanford tagger and segmenter input against line
  injection, verified on the real tools
- Bring the self-contained tests of #3753 to develop
- Guard the twitter CSV exports against formula and
  control-sequence injection, verified on the real corpus
- Guard the maxent parameter files against outside-root paths and
  unrepresentable names, verified on a real trained model
- Parse CCG lexicon categories in linear time and refuse oversized
  ones, verified under attack and on the documented grammars
  (GHSA-89p3-fcch-88ph, split from #3753)
- [Do not merge yet] Guard tool wrappers, Prover9 input and the
  downloader against injection and unbounded-response DoS
- Added RTL language syntactic tree visualization support
- Make the word, blankline and TextTiling tokenizers, the valuation
  parser, relextract and toktok linear on retried leading regex
  runs
- Add the 3.10.4 commit authors and security reporters to
  AUTHORS.md
- Pair the scaling samples by rep and size the under-margined
  probes over the floor
- Trusted spawn: O_NOFOLLOW and inode check on the final file, link
  owner and control-character checks, refusal reasons, argv[0] as
  invoked; real Graphviz in CI (#3887 follow-up)
- Support symlinked executables in pathsec
- [Do not merge yet] Keep downloaded archives private and serve
  other accounts through extraction (fixes #3928)
- Bound algorithmic-DoS and uncontrolled-recursion vectors
  (CWE-400/407/674/1333)
- Guard the two-class any-character runs and count apostrophe-named
  groups (follow-up to #3895)
- Fix #3394: Ensure punkt_tab is downloaded when punkt is requested
- Restore add_blank_lines and to_settings_string after the
  GHSA-f2h2 depth bound
- Let chat80.val_load read back what val_dump wrote
- Keep full collections out of timed scaling samples (89p3 teeth
  and relextract reds)
- CI: take the Windows Graphviz from the cached third-party tools,
  not Chocolatey
- Close the chat80 store swap window and read stores by a key
  manifest
- Route every module's file removal, rename, privacy test and
  sqlite open through pathsec
- Fix the develop CI breakage from the fg9w advisory merge (Senna
  -path separator, test fixtures under /tmp)
- Refuse relation walks deeper than MAX_RECURSION_DEPTH instead of
  truncating them
- Harden the Toolbox reader and writers after the #3958 re-audit
- Route the downloader, XML corpus view, internals and Toolbox
  through nltk.xmlsec and nltk.data
- Open gzip file names through pathsec, and refuse a linked PanLex
  Lite database
- Fix DependencyGraph cycle detection, dead on every parsed graph
- Bound YAML deserialization against depth and resource DoS,
  verified on the real loaders
- Guard java() cmd[0] against JEP 330 source-file execution,
  verified on a real JDK
- Make Tree.__repr__ iterative so a deep accepted tree does not
  overflow the stack
- Create perceptron model files exclusively under the pinned
  directory (issue 3980)
- Drop the dash-banner section dividers from the model-artifact
  tests
- Skip the real-launcher test when java resolves to a runtime-less
  stub
- Pin the CI megam download to https and its sha256
- Run the advisory probes only on a full-matrix run; keep the unit
  tests out of the wheel
- Charge the shipped-form teeth leg on CPU time (Windows regex
  timeout is wall-clock)
- Prepare NLTK release 3.10.4
- Rewrite the 3.10.4 release notes around the user-facing security
  changes
- Omit NULL targets from alignment strings
- Fix TweetTokenizer ZWJ pattern capturing whitespace
- Show, range and draw an alignment with an unaligned pair on every
  surface (follow-up to #3967, #1885)
- Pin the TweetTokenizer ZWJ alternative: linear on repeated
  shapes, no whitespace absorbed (follow-up to #3913)
- Credit every contributor since 3.10.3 in the 3.10.4 notes and
  AUTHORS.md; name the PRs merged after #3986
- Make the span_tokenize teeth control compute-bound so Windows
  reads its quadratic (deflake, test-only)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-nltk_3.10.3.bb => python3-nltk_3.10.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.10.3.bb => python3-nltk_3.10.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.4.bb
index 6140afdf13..fb7f05f432 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.3.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.10.4.bb
@@ -24,4 +24,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "bb9327a461c3811c2fa4900e03840401f2126adfb30c0072827c433bd2444ea4"
+SRC_URI[sha256sum] = "44679f4e9220abfd496d2c8cdb22f8425ccbe557604f9aa5cacb1c44003dabc1"
-- 
2.47.3

